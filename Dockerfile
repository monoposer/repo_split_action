# THIS IS BASE IMAGE
FROM php:8.0-cli

RUN apt-get update -y
RUN apt-get install git -y

## install composer
RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

ARG COMPOSER_PUID=1000
ARG COMPOSER_PGID=1000
RUN addgroup --gid ${COMPOSER_PGID} composer
RUN adduser --uid ${COMPOSER_PUID} --ingroup composer composer

USER composer

RUN composer global require  monoposer/monoposer 0.0.3

WORKDIR /home/composer

COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]