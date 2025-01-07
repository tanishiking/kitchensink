(module
  (type $say (func (param i32 i32 i32)))
  (rec
    (type $Base (sub (struct (field $foo i32))))
    (type $Derived (sub $Base (struct (field $foo i32))))
  )
  (import "tanishiking:ferris/ferris-says@0.0.2" "say" (func $say (type $say)))
  (export "memory" (memory $mem))
  (memory $mem 1)
)
