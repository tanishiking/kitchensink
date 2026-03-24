NODE ?= node --experimental-wasm-jspi
D8 ?= ~/v8-12.9/v8/out/release/d8
D8_FLAGS ?= --experimental-wasm-jspi

test.wasm:
	wasm-tools parse test.wat -o test.wasm

run-node: test.wasm
	$(NODE) test.mjs

run-d8: test.wasm
	$(D8) $(D8_FLAGS) --module test.mjs

run: test.wasm
	$(NODE) test.mjs

clean:
	rm -f test.wasm
