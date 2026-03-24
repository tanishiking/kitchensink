(module
  (import "env" "runPromising" (func $runPromising (param funcref) (result externref)))

  (func $worker (result externref)
    ref.null extern
  )

  (func $main (export "main") (result externref)
    (local $i i32)
    i32.const 1450
    local.set $i
    loop $loop
      ref.func $worker
      call $runPromising
      drop
      local.get $i
      i32.const 1
      i32.sub
      local.tee $i
      br_if $loop
    end
    ref.null extern
  )

  (elem declare funcref (ref.func $worker))
)
