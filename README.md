PHP 5.6.28 With Apache 2.4
---------------------------

Docker image based on Ubuntu 18.04. Using PHP 5.6 with Apache Module. In addition, the `error_reporting` is configurable per container via environment variable.

Usage
------

Build the docker image

```
$ docker build -t ub18.04-php5.6-apache2.4 .
```

Create container

```bash
$ docker run -tid --name php5.6 \
    -d -p 8080:80 \
    -v $(pwd):/var/www \
    -e PHP_ERROR_REPORTING='E_ALL & ~E_STRICT' \
    php5.6-apache2.4
```

* `-v [local path]:/var/www` map local path to container's path  `/var/www` 
* `-p [local port]:80` maps a local port to the container's HTTP port 80
* `-e PHP_ERROR_REPORTING=[php error_reporting settings]` sets the value of `error_reporting` in the php.ini files.

### Access apache logs
Apache is configured to log both access and error log to STDOUT. So you can simply use `docker logs` to get the log output:

`docker logs -f container-id`


Packages
---------
* Ubuntu Server 18.04, based on ubuntu docker image
* apache2.4
* libapache2-mod-php5.6
* php5.6
* php5.6-cli
* php5.6-curl
* php5.6-dev
* php5.6-gd
* php5.6-intl
* php5.6-json
* php5.6-xml
* php5.6-ldap
* php5.6-mysql
* php5.6-zip
* php5.6-mcrypt
* php5.6-mbstring
* php5.6-xdebug
* php-pear
* php-gettext


Configurations
----------------
* mod_rewrite with AllowOverride all
* php.ini:
  * display_errors = On
  * error_reporting = E_ALL & ~E_DEPRECATED & ~E_NOTICE (default, overridable per env variable)
