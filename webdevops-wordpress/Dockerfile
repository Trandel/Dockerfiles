FROM webdevops/php-nginx:ubuntu-16.04

ENV WORDPRESS_VERSION 4.8
ENV WORDPRESS_SHA1 3738189a1f37a03fb9cb087160b457d7a641ccb4

RUN set -ex; \
	curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz"; \
	echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c -; \
	tar -xzf wordpress.tar.gz -C /app/; \
	rm wordpress.tar.gz; \
	mv /app/wordpress/* /app/; \
	rm -rf  /app/wordpress/; \
	chown -R www-data: /app/*
