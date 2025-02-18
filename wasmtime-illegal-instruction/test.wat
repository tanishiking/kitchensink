(module
  (type $c.scala.Tuple1 (sub (struct
    (field $f.scala.Tuple1._1 (mut anyref)))))

  (func (export "test")
    (local $instance (ref $c.scala.Tuple1))
    i32.const -1
    ref.i31
    struct.new $c.scala.Tuple1
    drop
  )
)
