WASM_TOOLS = wasm-tools
NODE = node
INPUT_WAT = itoa.wat
OUTPUT_WASM = itoa.wasm
SCRIPT = index.mjs

# Default target
all: parse run

parse:
	$(WASM_TOOLS) parse $(INPUT_WAT) -o $(OUTPUT_WASM)

run:
	$(NODE) --experimental-wasm-imported-strings $(SCRIPT)

clean:
	rm -f $(OUTPUT_WASM)

.PHONY: all parse run clean
