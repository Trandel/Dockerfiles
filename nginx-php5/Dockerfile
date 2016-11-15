FROM phusion/baseimage:0.9.18

MAINTAINER Tomasz Trznadel @trandel

ENV FILEBEAT_VERSION 1.3.1
ENV FILEBEAT_SHA1 693c04e2251498e73436cfc2b36a3a0aec920a2d

ADD https://download.elastic.co/beats/filebeat/filebeat-${FILEBEAT_VERSION}-x86_64.tar.gz /tmp/filebeat.tar.gz

RUN echo "${FILEBEAT_SHA1}  /tmp/filebeat.tar.gz" > /tmp/filebeat.sha1 && \
    sha1sum -c /tmp/filebeat.sha1 && \
    mkdir -p /usr/src/filebeat && \
    mkdir -p /etc/filebeat && \
    tar zxvf /tmp/filebeat.tar.gz -C /usr/src/filebeat && \
    cp /usr/src/filebeat/filebeat-${FILEBEAT_VERSION}-x86_64/filebeat /bin && \
    cp /usr/src/filebeat/filebeat-${FILEBEAT_VERSION}-x86_64/filebeat.yml /etc/filebeat && \
    rm -rf /tmp/filebeat.tar.gz /tmp/filebeat.sha1

CMD ["/bin/filebeat", "-e", "-v", "-c", "/etc/filebeat/filebeat.yml"]

RUN apt-get update && apt-get -y upgrade

# Set  Europe/London timezone
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Basic Requirements
RUN apt-get -y install nginx curl unzip wget

RUN apt-get -y install php5 php5-fpm php5-mysql php-apc php5-curl php5-gd \
	php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache \
	php5-ming php5-ps php5-pspell php5-recode php5-sqlite php5-tidy \
	php5-xmlrpc php5-xsl php5-mcrypt php5-redis && \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
