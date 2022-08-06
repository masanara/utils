FROM alpine
RUN mkdir /run/nginx && apk add --update --no-cache curl nginx bind-tools bash sudo && ln -sf /dev/stdout /var/log/nginx/access.log
RUN chown -R nginx:nginx /var/log/nginx && chown -R nginx:nginx /run/nginx
RUN rm /etc/nginx/http.d/default.conf
ADD hello.conf /etc/nginx/http.d
ADD nginx.conf /etc/nginx
ADD hello.png /etc/nginx/http.d
ADD index.html /usr/share/nginx/html/
RUN addgroup nginx wheel
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
EXPOSE 80
CMD [ "/usr/sbin/nginx","-c","/etc/nginx/nginx.conf"]
