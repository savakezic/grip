FROM ubuntu

RUN ["apt-get", "update"]
RUN ["apt-get", "-y", "install", "build-essential", "libpcre3", "libpcre3-dev", "zlib1g", "zlib1g-dev", "libssl-dev", "libgd-dev", "libxml2", "libxml2-dev", "uuid-dev"]
RUN ["apt-get", "-y", "install", "wget", "gcc", "make", "nginx-core"]

WORKDIR "/tmp"
RUN ["wget", "http://nginx.org/download/nginx-1.19.9.tar.gz"]
RUN ["/bin/bash", "-c", "tar -xzf nginx-1.19.9.tar.gz && rm nginx-1.19.9.tar.gz"]
WORKDIR "./nginx-1.19.9"

RUN ["./configure", "--prefix=/var/www/html", "--sbin-path=/usr/sbin/nginx", "--conf-path=/etc/nginx/nginx.conf", "--http-log-path=/var/log/nginx/access.log", "--error-log-path=/var/log/nginx/error.log", "--with-pcre",  "--lock-path=/var/lock/nginx.lock", "--pid-path=/var/run/nginx.pid", "--with-http_ssl_module", "--with-http_image_filter_module=dynamic", "--modules-path=/etc/nginx/modules", "--with-http_v2_module", "--with-stream=dynamic", "--with-http_addition_module", "--with-http_mp4_module"]
RUN ["./configure", "--with-http_stub_status_module"]
RUN ["/bin/bash", "-c", "make && make install"]

COPY ./stub-status.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]
