(module
  (type $i16Array (array (mut i16)))

  (import "wasi:clocks/monotonic-clock@0.2.0" "now" (func $now (result i64)))
  (import "wasi:cli/stdout@0.2.0" "get-stdout" (func $getStdout (result i32)))
  (import "wasi:io/streams@0.2.0" "[method]output-stream.blocking-write-and-flush" (func $blockingWriteAndFlush (param i32 i32 i32 i32)))
  (import "wasi:io/streams@0.2.0" "[resource-drop]output-stream" (func $dropOutputStream (param i32)))

  (global $strLength i32
     i32.const 200)

  (func $run
    (result i32)

    (local $start i64)
    (local $end i64)
    (local $arr (ref $i16Array))
    (local $i i32)
    (local $iterations i32)
    (local $total_duration_write i64)
    (local $total_duration_read i64)

    i32.const 1000
    local.set $iterations
    i64.const 0
    local.set $total_duration_write
    i64.const 0
    local.set $total_duration_read

    global.get $strLength
    call $create
    local.set $arr

    loop $benchmark_loop
      ;; write arr to memory
      call $now
      local.set $start

      local.get $arr
      i32.const 0
      call $write_arr_to_mem

      call $now
      local.set $end

      local.get $total_duration_write
      local.get $end
      local.get $start
      i64.sub
      i64.add
      local.set $total_duration_write

      ;; read from memory
      call $now
      local.set $start
      global.get $strLength
      call $read_mem_to_arr
      drop
      call $now
      local.set $end

      local.get $total_duration_read
      local.get $end
      local.get $start
      i64.sub
      i64.add
      local.set $total_duration_read

      ;; i += 1
      local.get $i
      i32.const 1
      i32.add
      local.set $i

      ;; i < iterations
      local.get $i
      local.get $iterations
      i32.lt_u
      br_if $benchmark_loop
    end

    ;; local.get $total_duration_write
    local.get $total_duration_read
    local.get $iterations
    i64.extend_i32_u
    i64.div_u
    call $printInt

    i32.const 0
  )

  (func $create
    (param $length i32)
    (result (ref $i16Array))

    (local $arr (ref $i16Array))
    (local $i i32)

    local.get $length
    array.new_default $i16Array
    local.set $arr

    loop $loop
      ;; arr[i] = i
      local.get $arr
      local.get $i
      local.get $i
      array.set $i16Array

      ;; i += 1
      local.get $i
      i32.const 1
      i32.add
      local.set $i

      ;; i < length
      local.get $i
      local.get $length
      i32.lt_u
      br_if $loop
    end
    local.get $arr
  )

  (func $write_arr_to_mem
    (param $arr (ref $i16Array))
    (param $offset i32) ;; The starting address in linear memory

    (local $len i32)
    (local $i i32)

    local.get $arr
    array.len
    local.set $len

    loop $loop
      ;; offset + (i * 2)
      local.get $offset
      local.get $i
      i32.const 2
      i32.mul
      i32.add
      ;; arr[i]
      local.get $arr
      local.get $i
      array.get_s $i16Array
      ;; mem[offset + (i * 2)] = arr[i]
      i32.store16

      ;; i += 1
      local.get $i
      i32.const 1
      i32.add
      local.set $i

      ;; i < length
      local.get $i
      local.get $len
      i32.lt_u
      br_if $loop
    end
  )

  (func $read_mem_to_arr
    (param $length i32) ;; The length in bytes in linear memory
    (result (ref $i16Array))

    (local $arr (ref $i16Array))
    (local $arr_len i32)
    (local $i i32)

    ;; Calculate array length (length in bytes / 2)
    local.get $length
    i32.const 2
    i32.div_u
    local.set $arr_len

    ;; Create a new array
    local.get $arr_len
    array.new_default $i16Array
    local.set $arr

    loop $loop
      ;; Read value from memory and store in array
      ;; arr[i] = mem[i * 2]
      local.get $arr
      local.get $i
      ;; address to load from: i * 2
      local.get $i
      i32.const 2
      i32.mul
      i32.load16_s ;; loads a 16-bit signed value, sign-extends to i32
      array.set $i16Array

      ;; i += 1
      local.get $i
      i32.const 1
      i32.add
      local.set $i

      ;; if i < arr_len, continue loop
      local.get $i
      local.get $arr_len
      i32.lt_u
      br_if $loop
    end

    local.get $arr
  )

  (func $printInt
     (param $num i64)

     (local $ptr i32)
     (local $tmp i64)
     (local $length i32)
     (local $negative i32)
     (local $idx i32)
     (local $out i32)

     local.get $num ;; check if it's negative value
     i64.const 0
     i64.lt_s
     if
       local.get $num
       i64.const -1
       i64.mul
       local.set $num
       i32.const 1
       local.set $negative

       i32.const 1 ;; for '-'
       local.set $length
     else
       i32.const 0
       local.set $negative

       i32.const 0
       local.set $length
     end

     ;; calculate length
     local.get $num
     local.set $tmp
     loop $loop
       local.get $tmp
       i64.eqz
       if
       else
         local.get $tmp
         i64.const 10
         i64.div_s
         local.set $tmp
         local.get $length
         i32.const 1
         i32.add
         local.set $length
         br $loop
       end
     end

     local.get $num
     local.set $tmp

     local.get $length
     i32.const 1
     i32.sub
     local.set $idx

     loop $loop
       local.get $tmp
       i64.eqz
       if
       else
         local.get $idx ;; address to store
         local.get $tmp
         i64.const 10
         i64.rem_s
         i64.const 48
         i64.add
         i64.store8

         local.get $idx
         i32.const 1
         i32.sub
         local.set $idx

         local.get $tmp
         i64.const 10
         i64.div_s
         local.set $tmp
         br $loop
       end
     end
     local.get $negative
     if
       local.get $idx
       i32.const 45
       i32.store8
     end
     call $getStdout
     local.set $out

     local.get $out
     i32.const 0
     local.get $length
     local.get $length ;; return pointer address (dummy)
     call $blockingWriteAndFlush
     local.get $out
     call $dropOutputStream)

  (memory $mem 16)

  (export "wasi:cli/run@0.2.0#run" (func $run))
  (export "memory" (memory $mem))
)
