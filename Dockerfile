FROM alpine
RUN mkdir /run/nginx && apk add --update --no-cache curl nginx bind-tools bash && ln -sf /dev/stdout /var/log/nginx/access.log
ADD index.html /var/www/localhost/htdocs
ADD default.conf /etc/nginx/conf.d
ENTRYPOINT /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
