FROM webdevops/php-nginx:ubuntu-16.04

ENV CODEIGNITER_VERSION 3.1.2
ENV CODEIGNITER_SHA1 420def5db5a766cb5ed7288cabe44d5921a0df9d

RUN set -ex; \
	curl -o codeigniter.tar.gz -fSL "https://github.com/bcit-ci/CodeIgniter/archive/${CODEIGNITER_VERSION}.tar.gz"; \
	echo "$CODEIGNITER_SHA1 *codeigniter.tar.gz" | sha1sum -c -; \
	tar -xzf codeigniter.tar.gz -C /app/; \
	rm codeigniter.tar.gz; \
	mv /app/CodeIgniter-${CODEIGNITER_VERSION}/* /app/; \
	rm -rf /app/CodeIgniter-${CODEIGNITER_VERSION}; \
	rm -rf /app/user_guide; \
	rm -rf /app/application
