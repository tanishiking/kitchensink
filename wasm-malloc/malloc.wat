(module
  (import "helper" "print" (func $print (param i32)))
  (memory $memory 1) ;; 1page (64kb)
  (global $freep (mut i32) (i32.const -1))

  (export "memory" (memory $memory))
  (export "freep" (global $freep))

  (func (export "malloc") (param $nbytes i32) (result i32)
    (local $p i32)
    (local $prevp i32)
    (local $nunits i32)

    (local $block_size i32)

    global.get $freep
    i32.const 0
    i32.lt_s ;; $freep < 0
    if ;; initialize memory
      i32.const 16
      global.set $freep

      ;; initialize base block
      ;; next pointer
      i32.const 0
      global.get $freep
      i32.store $memory

      ;; size
      i32.const 4
      i32.const 1
      i32.store $memory

      ;; initialize freep
      ;; next pointer
      i32.const 8
      i32.const 8
      i32.store $memory

      ;; size
      i32.const 12
      i32.const 8191
      i32.store $memory
    end

    ;; prevp = freep
    global.get $freep
    local.set $prevp

    ;; p = prevp->next
    local.get $prevp
    i32.const 8
    i32.sub
    i32.load
    local.set $p

    ;; 8 = alignment
    ;; $nunits = ($nbytes + 8 - 1) / 8 + 1
    local.get $nbytes
    i32.const 7
    i32.add
    i32.const 8
    i32.div_u
    i32.const 1
    i32.add
    local.set $nunits

    loop $loop
      ;; block size
      local.get $p
      i32.const 4
      i32.sub
      i32.load $memory
      local.tee $block_size
      local.get $nunits
      i32.ge_u ;; $block_size >= $nunits (big enough)
      if
        local.get $block_size
        local.get $nunits
        i32.eq
        if ;; block_size equals $size
          ;; $prevp->next = $p->next
          local.get $prevp
          i32.const 8
          i32.sub
          local.get $p
          i32.const 8
          i32.sub
          i32.load $memory
          i32.store $memory
        else ;; block_size > $size
          ;; $p->size -= $nunits
          local.get $p
          i32.const 4
          i32.sub
          ;; block_size - ($size + 8)
          local.get $block_size
          local.get $nunits
          i32.sub
          i32.store

          ;; $p = $p + $p->size * 8
          local.get $p
          i32.const 4
          i32.sub
          i32.load
          i32.const 8
          i32.mul
          local.get $p
          i32.add
          local.tee $p

          ;; $p->size = nunits
          i32.const 4
          i32.sub
          local.get $nunits
          i32.store
        end

        ;; freep = prevp;
        local.get $prevp
        global.set $freep

        ;; return $p
        local.get $p
        return
      end ;; block_size >= $nunits

      ;; if p == freep
      ;; TODO: memory.grow here
      local.get $p
      global.get $freep
      i32.eq
      if ;; block not found
        i32.const -1
        return
      end

      ;; prevp = p
      local.get $p
      local.set $prevp
      ;; p = p->next
      local.get $p
      i32.const 8
      i32.sub
      i32.load
      local.set $p
      br $loop
    end ;; loop

    i32.const -1
  )

  (func (export "free") (param $bp i32)
    (local $p i32)

    block $exit
      ;; p = freep
      global.get $freep
      local.set $p

      loop $loop
        ;; !(bp > p && bp < p->s.ptr)
        ;; bp > p
        local.get $bp
        local.get $p
        i32.gt_u

        ;; bp < p->s.ptr
        local.get $bp
        local.get $p
        i32.const 8
        i32.sub
        i32.load
        i32.lt_u

        i32.and
        br_if $exit

        ;; (p >= p->s.ptr && (bp > p || bp < p->s.ptr))
        ;; p >= p->s.ptr
        local.get $p
        local.get $p
        i32.const 8
        i32.sub
        i32.load
        i32.ge_u

        ;; bp > p
        local.get $bp
        local.get $p
        i32.gt_u
        ;; bp < p->s.ptr
        local.get $bp
        local.get $p
        i32.const 8
        i32.sub
        i32.load
        i32.lt_u
        ;; (bp > p || bp < p->s.ptr)
        i32.or
        ;; (p >= p->s.ptr && (bp > p || bp < p->s.ptr))
        i32.and

        br_if $exit

        ;; p = p->next
        local.get $p
        i32.const 8
        i32.sub
        i32.load
        local.set $p

        br $loop
      end
    end ;; exit

    ;; join to upper neighbor
    ;; if (bp + bp->s.size == p->s.ptr)
    local.get $bp
    local.get $bp
    i32.const 4
    i32.sub
    i32.load
    i32.const 8
    i32.mul
    i32.add
    local.get $p
    i32.const 8
    i32.sub
    i32.load
    i32.eq

    if
      ;; bp->s.size += p->s.ptr->s.size;
      local.get $bp
      i32.const 4
      i32.sub
      ;; bp->s.size
      local.get $bp
      i32.const 4
      i32.sub
      i32.load
      ;; p->s.ptr->s.size
      local.get $p
      i32.const 8
      i32.sub
      i32.load
      i32.const 4
      i32.sub
      i32.load
      ;; bp->s.size + p->s.ptr->s.size;
      i32.add
      i32.store

      ;; bp->s.ptr = p->s.ptr->s.ptr;
      local.get $bp
      i32.const 8
      i32.sub

      ;; p->s.ptr->s.ptr
      local.get $p
      i32.const 8
      i32.sub
      i32.load
      i32.const 8
      i32.sub
      i32.load
      i32.store
    else
      ;; bp->s.ptr = p->s.ptr;
      local.get $bp
      i32.const 8
      i32.sub

      local.get $p
      i32.const 8
      i32.sub
      i32.load
      i32.store
    end

    ;; join to lower neighbor
    ;; p + p->s.size == bp
    local.get $p
    local.get $p
    i32.const 4
    i32.sub
    i32.load
    i32.const 8
    i32.mul
    i32.add
    local.get $bp
    i32.eq
    if
      ;; p->s.size+=bp->s.size;
      local.get $p
      i32.const 4
      i32.sub
      ;; p->s.size;
      local.get $p
      i32.const 4
      i32.sub
      i32.load
      ;; bp->s.size
      local.get $bp
      i32.const 4
      i32.sub
      i32.load
      i32.add
      i32.store

      ;; p->s.ptr=bp->s.ptr;
      local.get $p
      i32.const 8
      i32.sub
      local.get $bp
      i32.const 8
      i32.sub
      i32.load
      i32.store
    else
      ;; p->s.ptr = bp;
      local.get $p
      i32.const 8
      i32.sub
      local.get $bp
      i32.store
    end

    ;; freep = p;
    local.get $p
    global.set $freep
  )
)
