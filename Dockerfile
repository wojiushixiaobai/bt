FROM ubuntu:latest

WORKDIR /www

COPY sources.list /etc/apt/sources.list
COPY install-ubuntu_6.0.sh /tmp/install-ubuntu_6.0.sh
COPY entrypoint.sh /bin/entrypoint.sh
COPY Readme.txt /www/Readme.txt

RUN set -ex \
    && apt-get update \
    && apt-get -y install wget curl zip unzip openssh-client python-pip build-essential \
    && chmod +x /bin/entrypoint.sh \
    && bash /tmp/install-ubuntu_6.0.sh \
    && rm -rf /tmp/install-ubuntu_6.0.sh \
    && apt-get -y autoclean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf ~/.cache/pip

EXPOSE 20 21 80 443 888 8888
ENTRYPOINT ["entrypoint.sh"]
