#
# Start the server using docker-compose:
#
#   docker-compose up -d
#

FROM ubuntu:18.04
MAINTAINER Dolly Aswin <dolly.aswin@gmail.com>

VOLUME ["/var/www"]

ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    LANG=C.UTF-8 add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y \
      curl \
      git \
      vim \
      gettext \
      php5.6 \
      php5.6-cli \
      php5.6-curl \
      apache2 \
      libapache2-mod-php5.6 \
      php5.6-gd \
      php5.6-intl \
      php5.6-json \
      php5.6-xml \
      php5.6-ldap \
      php5.6-mysql \
      php5.6-zip \
      php5.6-mcrypt \
      php5.6-curl \
      php5.6-mbstring \
      php5.6-xdebug \
      php-gettext \
      php-pear \
      php5.6-dev

COPY docker/apache2/php5-6.vhost.conf /etc/apache2/sites-available/
COPY docker/apache2/apache2-foreground /usr/local/bin

RUN a2dissite 000-default \
    && a2enmod rewrite \
    && a2ensite php5-6.vhost

WORKDIR /var/www
EXPOSE 80
CMD ["apache2-foreground"]
