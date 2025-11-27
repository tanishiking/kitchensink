//> using scala 3.nightly

import language.experimental.captureChecking
import caps.Capability

class Counter extends Capability:
  private var value = 0
  def inc(): Unit = value += 1
  def get: Int = value

enum MyList[+A]:
  case Nil
  case Cons(head: A, tail: MyList[A])

  def map[B](f: A -> B): MyList[B] = this match
    case Nil => Nil
    case Cons(h, t) => Cons(f(h), t.map(f))

  def mkString(sep: String): String = this match
    case Nil => ""
    case Cons(h, t) => h.toString + (if t == Nil then "" else sep + t.mkString(sep))

@main def run(): Unit =
  val data = MyList.Cons(1, MyList.Cons(2, MyList.Nil))

  val c: Counter^ = new Counter

  // val increment: (() -> Unit)^{c1} = () => {
  //   c1.inc()
  //   c2.inc()
  // }

  // val result = data.map { x =>
  //   c.inc() // Error!
  //   x + c.get
  // }
