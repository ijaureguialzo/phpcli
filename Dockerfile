ARG PHP_VERSION
ARG ALPINE_VERSION

FROM php:${PHP_VERSION}-cli-alpine${ALPINE_VERSION}

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apk add --update --no-cache nodejs-current npm

RUN mkdir -p /workdir
WORKDIR /workdir
