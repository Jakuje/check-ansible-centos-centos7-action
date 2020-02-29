FROM centos:centos7

LABEL "maintainer"="L3D <l3d@c3woc.de>"
LABEL "repository"="https://github.com/roles-ansible/check-ansible-centos-centos7-action.git"
LABEL "homepage"="https://github.com/roles-ansible/check-ansible-centos-centos7-action"

LABEL "com.github.actions.name"="check-ansible-centos-centos7"
LABEL "com.github.actions.description"="Check ansible role or playbook with CentOS centos7"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="green"

RUN yum update --assumeyes && yum install --assumeyes epel-release

RUN yum install --assumeyes python \
    python-pip \
    git

RUN pip install setuptools && pip install ansible

RUN ansible --version

ADD ansible-docker.sh /ansible-docker.sh
ENTRYPOINT ["/ansible-docker.sh"]
