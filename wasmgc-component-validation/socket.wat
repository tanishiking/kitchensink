(module
  (type $add (func (param i32 i32) (result i32)))
  (rec
    (type $Base (sub (struct (field $foo i32))))
    (type $Derived (sub $Base (struct (field $foo i32))))
  )
  (import "tanishiking:test/addr@0.0.1" "add" (func $add (type $add)))
  (export "memory" (memory $mem))
  (memory $mem 1)
)
