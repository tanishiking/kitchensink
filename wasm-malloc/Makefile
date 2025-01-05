WASM_TOOLS = wasm-tools
DENO = deno
INPUT_WAT = malloc.wat
OUTPUT_WASM = malloc.wasm
SCRIPT = index.mjs

# Default target
all: parse run

parse:
	$(WASM_TOOLS) parse $(INPUT_WAT) -o $(OUTPUT_WASM)

run:
	$(DENO) run --allow-read $(SCRIPT)

clean:
	rm -f $(OUTPUT_WASM)

.PHONY: all parse run clean
