SOCK := socket.wat
SOCK_OUT := socket.wasm
# https://wa.dev/tanishiking:ferris-impl
# https://github.com/tanishiking/kitchensink/tree/main/ferris-says-component/ferris-impl
PLUG := tanishiking:ferris-impl
OUT := out.wasm

all: parse embed new plug validate

parse:
	wasm-tools parse $(SOCK) -o $(SOCK_OUT)

embed:
	wasm-tools component embed wit -o $(SOCK_OUT) $(SOCK_OUT)

new:
	wasm-tools component new -o $(SOCK_OUT) $(SOCK_OUT)

plug:
	wac plug --plug $(PLUG) $(SOCK_OUT) -o $(OUT)

validate:
	RUST_BACKTRACE=1 wasm-tools validate $(OUT)

clean:
	rm -f $(SOCK_OUT) ($(OUT)

.PHONY: all parse embed new plug validate clean
