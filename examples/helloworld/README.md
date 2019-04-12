# gRPC in 1 minute (PHP)

The example is based on docker image `yelfive/phpfpm-grpc:*`.
You can copy this whole "helloworld" directory to the created container
and then following the instructions bellow to start gRPC client with PHP.

> Notice that, currently gRPC supports PHP only as client, not server.

## Run the server

Please follow the instruction in [Node][] to run the server

```bash
cd examples/node
npm install
cd dynamic_codegen or cd static_codegen
node greeter_server.js
```

## Generate proto files and run the client

```bash
./greeter_proto_gen.sh
./run_greeter_client.sh
```

## NOTE

This directory has a copy of `helloworld.proto` because it currently depends on
some Protocol Buffer 3.0 syntax.

## TUTORIAL

You can find a more detailed tutorial in [gRPC Basics: PHP][]

[Node]:https://github.com/grpc/grpc/tree/master/examples/node
[gRPC Basics: PHP]:https://grpc.io/docs/tutorials/basic/php.html
