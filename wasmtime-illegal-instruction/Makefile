WASM_TOOLS = wasm-tools
INPUT_WAT = test.wat
OUTPUT_WASM = test.wasm

# Default target
all: parse run

parse:
	$(WASM_TOOLS) parse $(INPUT_WAT) -o $(OUTPUT_WASM)

run: parse
	wasmtime run -W function-references,gc --invoke test $(OUTPUT_WASM)

clean:
	rm -f $(OUTPUT_WASM)

.PHONY: all parse clean
