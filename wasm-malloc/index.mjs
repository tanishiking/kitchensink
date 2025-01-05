import { readFileSync } from "node:fs";

const UNIT_SIZE = 8;
const buf = readFileSync("malloc.wasm");
const importObj = {
  helper: {
    print: (i) => console.log(i),
  }
}
const wasmModule = await WebAssembly.instantiate(buf, importObj);
const { malloc, free, memory, freep } = wasmModule.instance.exports;
const mem = new Uint8Array(memory.buffer);

const b0 = malloc(32);
const b1 = malloc(32); // 65464
const b2 = malloc(32);
printHeader(memory.buffer, b1);
free(b1);
free(b0);
freelist(memory.buffer);


function freelist(memoryBuffer) {
  const chunks = makeChunks(memoryBuffer);
  console.log("freelist:")

  let idx = 0;
  while (true) {
    const chunk = chunks[idx];
    const dataView = new DataView(chunk.buffer, chunk.byteOffset, chunk.byteLength);
    const next = dataView.getUint32(0, true);
    const size = dataView.getUint32(4, true);

    console.log(`offset: ${idx * 8 + 8}, Size: ${size}, Next: ${next}`);

    const nextIdx = next / UNIT_SIZE - 1;
    if (nextIdx < idx) break; // Stop if we've looped
    idx = nextIdx;
  }
}

function printHeader(memoryBuffer, addr) {
  const chunks = makeChunks(memoryBuffer);
  const idx = addr / UNIT_SIZE - 1;
  const chunk = chunks[idx];
  const dataView = new DataView(chunk.buffer, chunk.byteOffset, chunk.byteLength);
  const next = dataView.getUint32(0, true);
  const size = dataView.getUint32(4, true);

  console.log(`header of offset: ${addr}, Size: ${size}, Next: ${next}`);
}

function makeChunks(memoryBuffer) {
  const mem = new Uint8Array(memoryBuffer);
  return Array.from({ length: Math.ceil(mem.length / UNIT_SIZE) }, (_, i) =>
    mem.slice(i * UNIT_SIZE, i * UNIT_SIZE + UNIT_SIZE)
  );
}
