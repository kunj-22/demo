FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y nginx zip curl sed \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

RUN curl -o /var/www/html/master.zip -L https://github.com/gabrielecirulli/2048/archive/master.zip \
    && cd /var/www/html/ \
    && unzip master.zip \
    && mv 2048-master/* . \
    && rm -rf 2048-master master.zip

# Replace all instances of "2048" with "kunj" in HTML and JS files
RUN find /var/www/html -type f \( -name "*.html" -o -name "*.js" \) -exec sed -i 's/2048/kunj/g' {} +

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
