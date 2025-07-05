INPUT := i16array-to-mem.wat
MODULE := i16array-to-mem.wasm
COMPONENT := component.wasm

validate:
	wasm-tools validate -g $(INPUT)

$(MODULE):
	wasm-tools parse $(INPUT) -o $(MODULE)

$(COMPONENT): $(MODULE)
	wasm-tools component embed wit $(MODULE) -o $(MODULE) && \
	wasm-tools component new $(MODULE) -o $(COMPONENT)

run: $(COMPONENT)
	wasmtime -W function-references,gc $(COMPONENT)

clean:
	rm -f $(MODULE) $(COMPONENT)

.PHONY: validate $(MODULE) $(COMPONENT) clean run
