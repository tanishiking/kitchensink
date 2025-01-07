CARGO_COMPONENT := cargo component
SOCK := socket.wat
SOCK_OUT := socket.wasm
PLUG_OUT := target/wasm32-wasip1/release/wasmgc_component_test.wasm
OUT := out.wasm

all: parse embed new plug compose validate

parse:
	wasm-tools parse $(SOCK) -o $(SOCK_OUT)

embed: parse
	wasm-tools component embed wit -w socket -o $(SOCK_OUT) $(SOCK_OUT)

new: embed
	wasm-tools component new -o $(SOCK_OUT) $(SOCK_OUT)

plug:
	$(CARGO_COMPONENT) build -r --target wasm32-wasip2

compose: plug new
	wac plug --plug $(PLUG_OUT) $(SOCK_OUT) -o $(OUT)

validate:
	RUST_BACKTRACE=1 wasm-tools validate $(OUT)

clean:
	rm -f $(SOCK_OUT) $(PLUG_OUT) $(OUT)

.PHONY: all components parse embed new plug compose validate clean
