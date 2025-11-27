//> using scala 3.nightly

import scala.language.experimental.captureChecking
import scala.language.experimental.separationChecking

import caps.*

class Ref(init: Int) extends Mutable:
  private var current = init
  def get: Int = current
  update def set(x: Int): Unit = current = x

@main def main() =
  val r = Ref(0)
  update(r, 4)
  println(read(r))

  // Separation failure: argument of type  () ->{r} Unit
  // to method par: [A, B](f: () => A, g: () => B): (A, B)
  // corresponds to capture-polymorphic formal parameter f of type  () => Unit
  // and hides capabilities  {r}.
  // Some of these overlap with the captures of the second argument with type  () ->{r} Unit.
  //
  //   Hidden set of current argument        : {r}
  //   Hidden footprint of current argument  : {r}
  //   Capture set of second argument        : {r}
  //   Footprint set of second argument      : {r}
  //   The two sets overlap at               : {r}
  //
  // where:    => refers to a fresh root capability created in method main when checking argument to parameter f of method par
  //     () => r.set(2),
  //     ^^^^^^^^^^^^^^
  // par(
  //   () => r.set(2),
  //   () => r.set(3)
  // )

  val newRef = inplaceUpdate(r, 100)

  // Separation failure: Illegal access to r.rd, which was passed as a consume parameter to method consume
  // on line ... and therefore is no longer available.
  // println(read(r)) // NG

  println(read(newRef)) // OK


// r: Ref^{cap.rd}
def read(r: Ref): Int =

  // r.set(0)
  r.get

def update(r: Ref^, value: Int): Unit =
  r.set(value)

def inplaceUpdate(consume a: Ref^, value: Int): Ref^ =
  a.set(value)
  a

def par[A, B](f: () => A, g: () => B): (A, B) = ???
