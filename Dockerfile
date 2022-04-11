FROM alpine:latest
LABEL maintainer="Przemyslaw Mejna"
LABEL description="Test image of Docker running on Alpine Linux"
RUN apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /tmp/nginx/
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/default.conf /etc/nginx/conf.d/default.conf 
ADD files/html.tar.gz /usr/share/nginx/
WORKDIR /
EXPOSE 80/tcp
ENTRYPOINT [ "nginx"]
CMD ["-g", "daemon off;"]