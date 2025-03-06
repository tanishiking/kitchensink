## Build

```sh
$ wkg wit fetch

$ cargo component build --target wasm32-wasip2 -r
    Creating component target/wasm32-wasip1/release/wasi_sockets_example.wasm
```

## Run

```sh
# start server on 127.0.0.1:8080
$ scala-cli server.scala
Server started on 127.0.0.1:8000

# or in python
$ python server.py

# send message to the server
$ wasmtime -S inherit-network=y target/wasm32-wasip1/release/wasi_sockets_example.wasm

# from server
# Client connected: /127.0.0.1
# Received: hello!
```

