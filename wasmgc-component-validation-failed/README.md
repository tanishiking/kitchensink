fixed https://github.com/bytecodealliance/wasm-tools/pull/1968

(1) Create a module (`socket.wat`) that uses GC types with subtypes:

```wat
(module
  (type $test (func))
  (rec
    (type $Base (sub (struct (field $foo i32))))
    (type $Derived (sub $Base (struct (field $foo i32))))
  )
  (import "tanishiking:wasmgc-component-test/tester@0.0.1" "test" (func $test (type $test)))
  (export "memory" (memory $mem))
  (memory $mem 1)
)
```

```wit
/// wit/world.wit
package tanishiking:wasmgc-component-test@0.0.1;

world plug {
    export tester;
}

world socket {
    import tester;
}

interface tester {
    test: func();
}
```

(2) Componetize it:

```sh
wasm-tools parse socket.wat -o socket.wasm
wasm-tools component embed wit -o socket.wasm -w socket socket.wasm
wasm-tools component new -o socket.wasm socket.wasm
```


(3) Build a plugin component (using cargo component)

```rust
// src/lib.rs
#[allow(warnings)]
mod bindings;

use crate::bindings::exports::tanishiking::wasmgc_component_test::tester::Guest;

struct Component;

impl Guest for Component {
    fn test() {
        println!("test")
    }
}

bindings::export!(Component with_types_in bindings);
```

```
// Cargo.toml
[package]
name = "wasmgc-component-test"
version = "0.1.0"
edition = "2021"

[dependencies]
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
package = "tanishiking:wasmgc-component-test"

[package.metadata.component.target]
world = "plug"

[package.metadata.component.dependencies]
```

```sh
$ cargo component build -r --target wasm32-wasip2
```


(4) Compose the `socket.wasm` module with plug:

```sh
$ wac plug --plug target/wasm32-wasip1/release/wasmgc_component_test.wasm -o out.wasm
```

(5) Validate

```sh
$ RUST_BACKTRACE=1 wasm-tools validate out.wasm
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
```

**Interestingly, when I removed `println!` macro from `src/lib.rs`, there's no problem in validation**
