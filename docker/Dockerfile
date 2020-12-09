#################################################################
# Dockerfile to build Zimbra Collaboration 8.8.15 container images
# Based on Ubuntu 16.04
#################################################################
FROM ubuntu:16.04
LABEL maintainer="Thomas Kraaibeek <thomaskraaibeek@gmail.com>"

RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  wget \
  dialog \
  openssh-client \
  software-properties-common \
  dnsmasq \
  dnsutils \
  net-tools \
  sudo \
  rsyslog \
  unzip

VOLUME ["/opt/zimbra"]

EXPOSE 22 25 465 587 110 143 993 995 80 443 8080 8443 7071

COPY opt /opt/

COPY etc /etc/

CMD ["/bin/bash", "/opt/start.sh", "-d"]
