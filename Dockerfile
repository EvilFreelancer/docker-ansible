FROM debian:stretch

RUN apt-get update \
 && apt-get install -y gnupg

RUN echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
 && apt-get update \
 && apt-get install -y ansible

ADD ["ansible", "/opt/ansible"]
ADD ["scripts", "/opt/scripts"]
ADD ["entrypoint.sh", "/"]

ENTRYPOINT ["/entrypoint.sh"]
