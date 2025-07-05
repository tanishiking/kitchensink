import { readFileSync } from "node:fs";
const imports = {
  performance: {
    now: () => performance.now(),
  }
}

const buf = readFileSync("i16array-to-mem.wasm");
const module = await WebAssembly.instantiate(buf, imports);
const { test } = module.instance.exports;

const elapsed = test(10000);
console.log(elapsed);
