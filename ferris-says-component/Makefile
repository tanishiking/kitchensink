WKG_OUT = tanishiking:ferris.wasm
REGISTRY = warg.wa.dev

all: wit

wit:
	wkg wit build -o $(WKG_OUT)

publish_wit:
	wkg publish --registry $(REGISTRY) $(WKG_OUT)

clean:
	rm -f $(WKG_OUT)

.PHONY: all wit clean
