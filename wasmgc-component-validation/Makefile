SOCK := socket.wat
PLUG := plug.wat
SOCK_OUT := socket.wasm
PLUG_OUT := plug.wasm
OUT := out.wasm

all: components plug validate
components: parse embed new

parse:
	wasm-tools parse $(SOCK) -o $(SOCK_OUT)
	wasm-tools parse $(PLUG) -o $(PLUG_OUT)

embed:
	wasm-tools component embed wit -w socket -o $(SOCK_OUT) $(SOCK_OUT)
	wasm-tools component embed wit -w plug -o $(PLUG_OUT) $(PLUG_OUT)

new:
	wasm-tools component new -o $(SOCK_OUT) $(SOCK_OUT)
	wasm-tools component new -o $(PLUG_OUT) $(PLUG_OUT)

plug:
	wac plug --plug $(PLUG_OUT) $(SOCK_OUT) -o $(OUT)

validate:
	wasm-tools validate $(OUT)

clean:
	rm -f $(SOCK_OUT) $(PLUG_OUT) $(OUT)

.PHONY: all components parse embed new plug validate clean
