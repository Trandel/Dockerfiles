FROM alpine:latest

ENV MYSQL_PORT="3306"
ENV MYSQL_USER="root"

COPY wait.sh /usr/local/bin/wait.sh
CMD /usr/local/bin/wait.sh

RUN set -ex; \
  apk update; \
	apk add mysql-client
