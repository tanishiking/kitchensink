(module
  (type $add (func (param i32 i32) (result i32)))
  ;; (rec
  ;;   (type $Base (sub (struct (field $foo i32))))
  ;;   (type $Derived (sub $Base (struct (field $foo i32))))
  ;; )
  (func $add (type $add)
    (param $a i32) (param $b i32) (result i32)
    local.get $a
    local.get $b
    i32.add
  )
  (export "tanishiking:test/addr@0.0.1#add" (func $add))
  (export "memory" (memory $mem))
  (memory $mem 1)
)
