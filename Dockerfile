FROM php:7.0.2-fpm

MAINTAINER andri@otka.co.id

ENV TERM xterm

RUN apt-get update -y 
RUN apt-get install tar unzip -y

ADD https://github.com/andreal01/myrepodocker/archive/master.zip /root/
RUN unzip /root/master.zip -d /root/
RUN cd /root && mv myrepodocker-master repo-git

RUN mkdir -p /srv/www/localhost/public_html/
RUN mkdir -p /srv/www/localhost/temp/logs/
RUN cp /root/repo-git/assets/repo/nginx.repo /etc/apt/sources.list.d/
RUN curl http://nginx.org/keys/nginx_signing.key | apt-key add -
RUN apt-get update -y 
RUN apt-get install nginx -y
RUN useradd -ms /bin/bash andri

RUN rm -rf /etc/nginx/ 
RUN cp -R /root/repo-git/assets/etc/nginx /etc/
RUN cp /root/repo-git/assets/www/index.php /srv/www/localhost/public_html/index.php

RUN chmod -R 0755 /srv/www/ && chown -R www-data /srv/www/ && chgrp -R www-data /srv/www/
RUN chown -R andri /srv/www/localhost/temp/logs/ && chgrp -R andri /srv/www/localhost/temp/logs/ && chmod -R 0755 /srv/www/localhost/temp/logs/

RUN apt-get clean all -y \
&& rm -rf /tmp/* /var/tmp/* \
&& rm -rf /root/repo-git/ \
&& rm -f /root/master.zip

RUN service nginx start

# Add the custom configuration file we made 
ADD ./config.yml cmd/registry/

# Set the configuration file to config.yml
env DOCKER_REGISTRY_CONFIG cmd/registry/config.yml

# Make sure we use the dev configuration settings 
env SETTINGS_FLAVOR dev

EXPOSE 80
VOLUME ["/srv/www/localhost/"]
CMD ["/sbin/init"]
