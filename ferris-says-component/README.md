## Define a WIT package and publish to registry

```sh
$ make wit
wkg wit build -o tanishiking:ferris.wasm
WIT package written to tanishiking:ferris.wasm

$ make publish_wit
wkg publish --registry warg.wa.dev tanishiking:ferris.wasm
Published tanishiking:ferris@0.0.2
```

Publish to https://wa.dev/tanishiking:ferris

## Implement interface

```sh
$ cargo component new --lib --namespace tanishiking --target tanishiking:ferris@0.0.2 ferris-impl
```

(cargo-component v0.19.0 didn't work with `Error: no registry configured for namespace "tanishiking"` :thinking_face: using v0.17.0, not sure about v0.18.0)

```sh
$ cd ferris-impl
$ cargo component build --target wasm32-wasip2 -r
  Generating bindings for ferris (src/bindings.rs)
   Compiling ferris v0.1.0 (/Users/tanishiking/ghq/github.com/tanishiking/kitchensink/ferris-says-component/ferris)
    Finished `release` profile [optimized] target(s) in 8.05s
    Creating component target/wasm32-wasip1/release/ferris.wasm

$ cargo component publish --registry warg.wa.dev
```

it didn't end indeinitely...

```sh
$ wkg publish --registry warg.wa.dev --package tanishiking:ferris-impl@0.0.2 target/wasm32-wasip1/release/ferris_impl.wasm
Published tanishiking:ferris-impl@0.0.2
```

https://wa.dev/config/tanishiking:ferris-impl

### fetch interface

For example,

```sh
package tanishiking:test@0.0.1;

world run {
    import tanishiking:ferris/ferris-says@0.0.2;
    export wasi:cli/run@0.2.0;
}
```

`wkg wit fetch`

## Componse Wasm Component

```sh
$ wac plug --plug tanishiking:ferris-impl <your component> -o out.wasm
```


$ wac plug --plug tanishiking:ferris-impl@0.0.2 main.wasm -o out.wasm
error: the socket component had no matching imports for the plugs that were provided
