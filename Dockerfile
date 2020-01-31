FROM alpine
RUN mkdir /run/nginx && apk add --update --no-cache curl nginx bind-tools bash && ln -sf /dev/stdout /var/log/nginx/access.log
RUN rm /etc/nginx/conf.d/*
ADD hello.conf /etc/nginx/conf.d
ADD hello.png /etc/nginx/conf.d
ADD index.html /usr/share/nginx/html/
CMD [ "/usr/sbin/nginx","-g","daemon off;","-c","/etc/nginx/nginx.conf"]
