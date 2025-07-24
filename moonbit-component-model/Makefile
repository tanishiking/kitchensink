TARGET:=wasm# wasm-gc (it doesn't work)

serve:
	wasmtime serve target/$(TARGET)/debug/build/gen/gen.wasm

build:
	moon build --target $(TARGET) -g
	wasm-tools component embed wit target/$(TARGET)/debug/build/gen/gen.wasm -o target/$(TARGET)/debug/build/gen/gen.wasm --encoding utf16 -g
	wasm-tools component new target/$(TARGET)/debug/build/gen/gen.wasm -o target/$(TARGET)/debug/build/gen/gen.wasm -g

regenerate:
	wkg wit fetch
	wit-bindgen moonbit --out-dir . wit --derive-show --derive-eq
	moon fmt
