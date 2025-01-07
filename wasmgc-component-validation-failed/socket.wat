(module
  (type $test (func))
  (rec
    (type $Base (sub (struct (field $foo i32))))
    (type $Derived (sub $Base (struct (field $foo i32))))
  )
  (import "tanishiking:wasmgc-component-test/tester@0.0.1" "test" (func $test (type $test)))
  (export "memory" (memory $mem))
  (memory $mem 1)
)
