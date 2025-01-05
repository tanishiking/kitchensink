# Rudimentary malloc/free (from K&R) in Wasm

[Memory Allocator for embedded system (K & R Ritchie book) | gnuchops](https://gnuchops.wordpress.com/2013/02/26/memory-allocator-for-embedded-system-k-r-ritchie-book/)

```sh
$ make
wasm-tools parse malloc.wat -o malloc.wasm
deno run --allow-read index.mjs
header of offset: 65464, Size: 5, Next: 0
freelist:
offset: 8, Size: 1, Next: 16
offset: 16, Size: 8176, Next: 65464
offset: 65464, Size: 10, Next: 8
```
