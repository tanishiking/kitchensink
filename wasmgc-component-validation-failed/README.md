
```sh
$ cat socket.wat
(module
  (type $say (func (param i32 i32 i32)))
  (rec
    (type $base (sub (struct (field $foo i32))))
    (type $derived (sub $base (struct (field $foo i32))))
  )
  (import "tanishiking:ferris/ferris-says@0.0.2" "say" (func $say (type $say)))
  (export "memory" (memory $mem))
  (memory $mem 1)
)
```

this wasm module is to be composed with [tanishiking:ferris-impl@0.0.2](https://wa.dev/tanishiking:ferris-impl) which is a simple wasm component library of `ferris-say` built/published from [cargo component project](https://github.com/tanishiking/kitchensink/tree/main/ferris-says-component/ferris-impl). (using `cargo component 0.17.0`)

```rust
/// cat src/lib.rs
#[allow(warnings)]
mod bindings;

use bindings::exports::tanishiking::ferris::ferris_says::guest;

use ferris_says::say;
use std::io::{stdout, bufwriter};

struct component;

impl guest for component {
    fn say(content: string, width: u32) {
        let stdout = stdout();
        let mut writer = bufwriter::new(stdout.lock());
        say(content.as_str(), width.try_into().unwrap(), &mut writer).unwrap();
    }
}

bindings::export!(component with_types_in bindings);
```

```cargo.toml
[package]
name = "ferris-impl"
version = "0.0.2"
edition = "2021"

[dependencies]
ferris-says = "0.3.2"
wit-bindgen-rt = { version = "0.36.0", features = ["bitflags"] }

[lib]
crate-type = ["cdylib"]

[profile.release]
codegen-units = 1
opt-level = "s"
debug = false
strip = true
lto = true

[package.metadata.component]
package = "tanishiking:ferris-impl"
target = "tanishiking:ferris@0.0.2"

[package.metadata.component.dependencies]
```

---

```sh
$ wasm-tools --version
wasm-tools 1.222.0 (892d4b6ef 2024-12-18)

# using local build for wac of
# https://github.com/bytecodealliance/wac/commit/6c22d80fc5fe6331b28c6d1482e8f9b60a8785f3
# to support gc types
$ wac --version
wac-cli 0.7.0-dev

$ make
wasm-tools parse socket.wat -o socket.wasm
wasm-tools component embed wit -o socket.wasm socket.wasm
wasm-tools component new -o socket.wasm socket.wasm
wac plug --plug tanishiking:ferris-impl socket.wasm -o out.wasm
rust_backtrace=1 wasm-tools validate out.wasm
thread 'main' panicked at crates/wasmparser/src/validator/types.rs:998:70:
indexmap: index out of bounds
stack backtrace:
   0: _rust_begin_unwind
   1: core::panicking::panic_fmt
   2: core::option::expect_failed
   3: wasmparser::validator::core::canonical::internrecgroup::check_subtype
   4: wasmparser::validator::core::module::add_types
   5: wasmparser::validator::validator::type_section
   6: wasmparser::validator::validator::payload
   7: wasm_tools::validate::opts::run
   8: wasm_tools::wasmtools::run
   9: wasm_tools::main
note: some details are omitted, run with `rust_backtrace=full` for a verbose backtrace.
make: *** [validate] error 101
```
