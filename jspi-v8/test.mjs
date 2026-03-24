const wasmPath = "test.wasm";
const wasmBytes =
  typeof readbuffer === "function"
    ? readbuffer(wasmPath)
    : await import("node:fs/promises").then(({ readFile }) => readFile(wasmPath));

const { instance } = await WebAssembly.instantiate(
  wasmBytes,
  {
    env: {
      runPromising(f) {
        return WebAssembly.promising(f)();
      }
    }
  }
);

await WebAssembly.promising(instance.exports.main)();
