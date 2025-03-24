import { readFileSync } from "node:fs";
const imports = {
  js: {
    init_state: () => {
      return 1
    },
    foo: () => { console.log("foo") },
    compute_delta: new WebAssembly.Suspending(async () => {
      console.log('run:compute_delta')
      return 3
    })
  }
}

const buf = readFileSync("test.wasm");
const wasmModule = await WebAssembly.instantiate(buf, imports);

const update_state = WebAssembly.promising(wasmModule.instance.exports.update_state);
console.log('call update_state');
console.log(await update_state());
