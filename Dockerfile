FROM yelfive/phpfpm-automated:7.2.3-1
LABEL maintainer="yelfivehuang@gmail.com"

# make china mirror as globally default reponsitory
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

# gRPC Runtime extension for PHP: grpc.so
COPY ext/grpc.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/grpc.so
RUN echo extension=grpc.so > /usr/local/etc/php/conf.d/grpc.ini

# protobuf Runtime extesnion for PHP: protobuf.so
COPY ext/protobuf.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/protobuf.so
RUN echo extension=protobuf.so > /usr/local/etc/php/conf.d/protobuf.ini

# protoc, compoiler of protocol buffer
COPY bin/protoc /usr/local/bin/
COPY include/* /usr/local/include/

# grpc_php_plugin, for protoc, to generate PHP gRPC service interface out of Protobuf IDL
# IDL: Interface Definition Language, aka. *.proto
# After installing the plugin, the following command will be available
#           protoc --php_out=<dir of generated *.php> file.proto
COPY bin/grpc_php_plugin /usr/local/bin/grpc_php_plugin
