#!/bin/bash

# rebuild and push all the wordpress versions
DOCKER_REPO="webdevops-wordpress"
DOCKER_HUB_USERNAME="trandel"
VERSIONS=$( curl -s "https://hub.docker.com/v2/repositories/trandel/webdevops-wordpress/tags/?page_size=100" | jq -r ".results[].name" | grep -v latest )

for VER in $VERSIONS; do
  SHA1=$( curl -fsSL "https://wordpress.org/wordpress-${VER}.tar.gz.sha1" )
  docker build --build-arg WORDPRESS_VERSION="${VER}" --build-arg WORDPRESS_SHA1="${SHA1}" -t "${DOCKER_HUB_USERNAME}/${DOCKER_REPO}:${VER}" .
  docker push "${DOCKER_HUB_USERNAME}/${DOCKER_REPO}:${VER}";
  docker build --build-arg WORDPRESS_VERSION="${VER}" --build-arg WORDPRESS_SHA1="${SHA1}" -t "${DOCKER_HUB_USERNAME}/${DOCKER_REPO}:php74-${VER}" -f DockerfilePHP74 .
  docker push "${DOCKER_HUB_USERNAME}/${DOCKER_REPO}:php74-${VER}";
done
