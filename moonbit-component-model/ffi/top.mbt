// Generated by `wit-bindgen` 0.43.0. DO NOT EDIT!

///|
pub extern "wasm" fn extend16(value : Int) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.extend16_s)

///|
pub extern "wasm" fn extend8(value : Int) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.extend8_s)

///|
pub extern "wasm" fn store8(offset : Int, value : Int) =
  #|(func (param i32) (param i32) local.get 0 local.get 1 i32.store8)

///|
pub extern "wasm" fn load8_u(offset : Int) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.load8_u)

///|
pub extern "wasm" fn load8(offset : Int) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.load8_s)

///|
pub extern "wasm" fn store16(offset : Int, value : Int) =
  #|(func (param i32) (param i32) local.get 0 local.get 1 i32.store16)

///|
pub extern "wasm" fn load16(offset : Int) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.load16_s)

///|
pub extern "wasm" fn load16_u(offset : Int) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.load16_u)

///|
pub extern "wasm" fn store32(offset : Int, value : Int) =
  #|(func (param i32) (param i32) local.get 0 local.get 1 i32.store)

///|
pub extern "wasm" fn load32(offset : Int) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.load)

///|
pub extern "wasm" fn store64(offset : Int, value : Int64) =
  #|(func (param i32) (param i64) local.get 0 local.get 1 i64.store)

///|
pub extern "wasm" fn load64(offset : Int) -> Int64 =
  #|(func (param i32) (result i64) local.get 0 i64.load)

///|
pub extern "wasm" fn storef32(offset : Int, value : Float) =
  #|(func (param i32) (param f32) local.get 0 local.get 1 f32.store)

///|
pub extern "wasm" fn loadf32(offset : Int) -> Float =
  #|(func (param i32) (result f32) local.get 0 f32.load)

///|
pub extern "wasm" fn storef64(offset : Int, value : Double) =
  #|(func (param i32) (param f64) local.get 0 local.get 1 f64.store)

///|
pub extern "wasm" fn loadf64(offset : Int) -> Double =
  #|(func (param i32) (result f64) local.get 0 f64.load)

///|
pub extern "wasm" fn f32_to_i32(value : Float) -> Int =
  #|(func (param f32) (result i32) local.get 0 f32.convert_i32_s)

///|
pub extern "wasm" fn f32_to_i64(value : Float) -> Int64 =
  #|(func (param f32) (result i64) local.get 0 f32.convert_i64_s)

// set pseudo header; allocate extra bytes for string

///|
pub extern "wasm" fn malloc(size : Int) -> Int =
  #|(func (param i32) (result i32) (local i32)
  #| local.get 0 i32.const 4 i32.add call $moonbit.gc.malloc
  #| local.tee 1 i32.const 0 call $moonbit.init_array8
  #| local.get 1 i32.const 8 i32.add)

///|
pub extern "wasm" fn free(position : Int) =
  #|(func (param i32) local.get 0 i32.const 8 i32.sub call $moonbit.decref)

///|
extern "wasm" fn copy(dest : Int, src : Int, len : Int) =
  #|(func (param i32) (param i32) (param i32) local.get 0 local.get 1 local.get 2 memory.copy)

///|
pub extern "wasm" fn str2ptr(str : String) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.const 8 i32.add)

///|
pub extern "wasm" fn ptr2str(ptr : Int, len : Int) -> String =
  #|(func (param i32) (param i32) (result i32) (local i32)
  #| local.get 0 i32.const 8 i32.sub local.tee 2
  #| local.get 1 call $moonbit.init_array16
  #| local.get 2)

///|
pub extern "wasm" fn bytes2ptr(bytes : FixedArray[Byte]) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.const 8 i32.add)

///|
pub extern "wasm" fn ptr2bytes(ptr : Int, len : Int) -> FixedArray[Byte] =
  #|(func (param i32) (param i32) (result i32) (local i32)
  #| local.get 0 i32.const 8 i32.sub local.tee 2
  #| local.get 1 call $moonbit.init_array8
  #| local.get 2)

///|
pub extern "wasm" fn uint_array2ptr(array : FixedArray[UInt]) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.const 8 i32.add)

///|
pub extern "wasm" fn uint64_array2ptr(array : FixedArray[UInt64]) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.const 8 i32.add)

///|
pub extern "wasm" fn int_array2ptr(array : FixedArray[Int]) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.const 8 i32.add)

///|
pub extern "wasm" fn int64_array2ptr(array : FixedArray[Int64]) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.const 8 i32.add)

///|
pub extern "wasm" fn float_array2ptr(array : FixedArray[Float]) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.const 8 i32.add)

///|
pub extern "wasm" fn double_array2ptr(array : FixedArray[Double]) -> Int =
  #|(func (param i32) (result i32) local.get 0 i32.const 8 i32.add)

///|
pub extern "wasm" fn ptr2uint_array(ptr : Int, len : Int) -> FixedArray[UInt] =
  #|(func (param i32) (param i32) (result i32) (local i32)
  #| local.get 0 i32.const 8 i32.sub local.tee 2
  #| local.get 1 call $moonbit.init_array32
  #| local.get 2)

///|
pub extern "wasm" fn ptr2int_array(ptr : Int, len : Int) -> FixedArray[Int] =
  #|(func (param i32) (param i32) (result i32) (local i32)
  #| local.get 0 i32.const 8 i32.sub local.tee 2
  #| local.get 1 call $moonbit.init_array32
  #| local.get 2)

///|
pub extern "wasm" fn ptr2float_array(ptr : Int, len : Int) -> FixedArray[Float] =
  #|(func (param i32) (param i32) (result i32) (local i32)
  #| local.get 0 i32.const 8 i32.sub local.tee 2
  #| local.get 1 call $moonbit.init_array32
  #| local.get 2)

///|
pub extern "wasm" fn ptr2uint64_array(
  ptr : Int,
  len : Int,
) -> FixedArray[UInt64] =
  #|(func (param i32) (param i32) (result i32) (local i32)
  #| local.get 0 i32.const 8 i32.sub local.tee 2
  #| local.get 1 call $moonbit.init_array64
  #| local.get 2)

///|
pub extern "wasm" fn ptr2int64_array(ptr : Int, len : Int) -> FixedArray[Int64] =
  #|(func (param i32) (param i32) (result i32) (local i32)
  #| local.get 0 i32.const 8 i32.sub local.tee 2
  #| local.get 1 call $moonbit.init_array64
  #| local.get 2)

///|
pub extern "wasm" fn ptr2double_array(
  ptr : Int,
  len : Int,
) -> FixedArray[Double] =
  #|(func (param i32) (param i32) (result i32) (local i32)
  #| local.get 0 i32.const 8 i32.sub local.tee 2
  #| local.get 1 call $moonbit.init_array64
  #| local.get 2)

///|
pub fn cabi_realloc(
  src_offset : Int,
  src_size : Int,
  _dst_alignment : Int,
  dst_size : Int,
) -> Int {
  // malloc
  if src_offset == 0 && src_size == 0 {
    return malloc(dst_size)
  }
  // free
  if dst_size == 0 {
    free(src_offset)
    return 0
  }
  // realloc
  let dst = malloc(dst_size)
  copy(dst, src_offset, if src_size < dst_size { src_size } else { dst_size })
  free(src_offset)
  dst
}

///|
pub(open) trait Any {}

///|
pub(all) struct Cleanup {
  address : Int
  size : Int
  align : Int
}
