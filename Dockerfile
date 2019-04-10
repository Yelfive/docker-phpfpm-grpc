FROM yelfive/phpfpm-automated:7.2.3-1
LABEL maintainer="yelfivehuang@gmail.com"

WORKDIR /var/www/html

# gRPC Runtime extension for PHP: grpc.so
RUN pecl install grpc-1.19.0
RUN echo extension=grpc.so > /usr/local/etc/php/conf.d/grpc.ini

# protobuf Runtime extesnion for PHP: protobuf.so
RUN pecl install protobuf
RUN echo extension=protobuf.so > /usr/local/etc/php/conf.d/protobuf.ini

# protoc, compoiler of protocol buffer
COPY bin/protoc /usr/local/bin/
COPY include/* /usr/local/include/

# grpc_php_plugin, for protoc, to generate PHP gRPC service interface out of Protobuf IDL
# IDL: Interface Definition Language, aka. *.proto
# After installing the plugin, the following command will be available
#           protoc --php_out=<dir of generated *.php> file.proto
RUN git clone -b $(curl -L https://grpc.io/release) https://github.com/grpc/grpc

WORKDIR grpc

RUN git submodule update --init \
    && make grpc_php_plugin \
    && mv bins/opt/grpc_php_plugin /usr/local/bin/
# grpc_php_plugin installed

WORKDIR /var/www/html

RUN rm -rf *
