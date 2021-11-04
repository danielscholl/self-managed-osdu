FROM danielscholl/alpine-nginx
COPY site.conf /etc/nginx/sites-enabled/default
RUN mkdir -p /var/www/login
WORKDIR /var/www
COPY index.html /var/www/login
