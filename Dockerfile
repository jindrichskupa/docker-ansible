ARG PYTHON_VERSION=3.9.5
ARG DEBIAN_VERSION=buster

FROM python:${PYTHON_VERSION}-slim-${DEBIAN_VERSION}

ARG ANSIBLE_VERSION=2.9

RUN apt update && \
    apt install -y openssh-client git sshpass && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN pip install pip --upgrade
RUN pip install ansible==${ANSIBLE_VERSION} Jinja2==2.11.3 ansible-lint yamllint ansible-review
