import { readFileSync } from "node:fs";
const wasmBuffer = readFileSync("itoa.wasm");
const importObj = {}
const wasmModule = await WebAssembly.instantiate(wasmBuffer, importObj, { builtins: ['js-string'] });
const { test } = wasmModule.instance.exports;
console.log(test(0));
console.log(test(1));
console.log(test(-100));
console.log(test(-1395235));
console.log(test(999235));
