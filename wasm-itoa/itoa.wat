(module
  (type $i16Array (array (mut i16))) ;; Define an i16 array type

  (import "wasm:js-string" "fromCharCodeArray" (func $fromCharCodeArray (param (ref null $i16Array)) (param i32) (param i32) (result (ref extern))))

  (func (export "test") (param $i i32) (result (ref extern))
    (local $array (ref null $i16Array))
    local.get $i
    call $itoa
    local.tee $array ;; array
    i32.const 0 ;; array 0
    local.get $array
    array.len ;; array 0 length
    call $fromCharCodeArray
  )

  (func $itoa (param $n i32) (result (ref $i16Array))
    (local $temp_n i32)
    (local $array_len i32)
    (local $index i32)
    (local $negative i32)
    (local $result (ref $i16Array))

    local.get $n
    i32.const 0
    i32.eq
    if
      i32.const 48 ;; '0' character (ASCII/Unicode 48)
      array.new_fixed $i16Array 1
      return
    end

    local.get $n
    i32.const 0
    i32.lt_s
    if (result i32) ;; length
      local.get $n
      i32.const -1
      i32.mul
      local.set $n

      i32.const 1
      local.set $negative
      ;; Increment array length for '-' sign
      i32.const 1
    else
      i32.const 0
      local.set $negative
      i32.const 0
    end
    local.set $array_len

    ;; Now we calculate the number of digits
    local.get $n
    local.set $temp_n
    loop $l
      local.get $temp_n
      i32.eqz
      if ;; break if 0
      else
        ;; temp_n /= 10
        local.get $temp_n
        i32.const 10
        i32.div_s
        local.set $temp_n

        local.get $array_len
        i32.const 1
        i32.add
        local.set $array_len
        br $l
      end
    end

    local.get $array_len
    array.new_default $i16Array
    local.set $result

    ;; Now fill the array from the last index (right to left)
    local.get $n
    local.set $temp_n

    local.get $array_len
    i32.const 1
    i32.sub
    local.set $index

    loop $loop
      local.get $temp_n
      i32.eqz
      if
      else
        ;; Store it in the array at the current index
        local.get $result ;; array to store
        local.get $index  ;; Current index

        local.get $temp_n
        i32.const 10
        i32.rem_s
        i32.const 48 ;; '0'
        i32.add ;; character
        array.set $i16Array  ;; Set character in the array

        ;; decrement
        local.get $index
        i32.const 1
        i32.sub
        local.set $index

        ;; Update temp_n = temp_n / 10
        local.get $temp_n
        i32.const 10
        i32.div_s
        local.set $temp_n

        br $loop
      end
    end

    ;; If the number was negative, add the '-' sign
    local.get $negative
    if
      ;; Store the '-' character at the start of the array (index 0)
      local.get $result
      i32.const 0   ;; First index
      i32.const 45  ;; '-' character (ASCII/Unicode 45)
      array.set $i16Array
    end

    local.get $result
  )
)
