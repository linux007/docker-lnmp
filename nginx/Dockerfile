FROM centos:6

#VOLUME /app/nginx

EXPOSE 80 443
WORKDIR /usr/local/src
#RUN yum -y update && \
#    yum -y install epel-release && \
#    yum -y install nginx && \
#    yum clean all
RUN yum -y install wget make zlib zlib-devel gcc-c++ libtool  openssl openssl-devel
RUN wget https://ftp.pcre.org/pub/pcre/pcre-8.40.tar.gz
RUN tar zxvf pcre-8.40.tar.gz && \
    cd pcre-8.40 && \
    ./configure && \
    make && make install

#zlib
RUN wget http://zlib.net/zlib-1.2.11.tar.gz
RUN tar zxvf zlib-1.2.11.tar.gz

#init
RUN useradd -M -s /sbin/nologin www
RUN mkdir -p /app/nginx

#install
RUN wget http://nginx.org/download/nginx-1.10.1.tar.gz
RUN tar zxvf nginx-1.10.1.tar.gz && \
    cd nginx-1.10.1 && \
    ./configure \
    --user=www \
    --group=www \
    --conf-path=/app/nginx/conf/nginx.conf \
    --error-log-path=/app/nginx/logs/error.log \
    --with-pcre=../pcre-8.40 \
    --with-zlib=../zlib-1.2.11 \
    --with-http_stub_status_module \
    --with-http_v2_module \
    --with-http_ssl_module \
    --with-ipv6 \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --with-http_flv_module && \
    make && make install
# define variable
ARG PHP_VERSION
COPY nginx.conf /app/nginx/conf/nginx.conf
RUN sed -i "s/php56/${PHP_VERSION}/g" /app/nginx/conf/nginx.conf

CMD ["/usr/local/nginx/sbin/nginx","-g","daemon off;"]

