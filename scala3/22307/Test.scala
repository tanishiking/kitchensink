import Foo._
// trait I0[T0] {
//   def func0(arg0: T0): Unit
//   def func1(arg0: Object): Unit = {}
// }

trait I1 extends I0[I1] {
  def func0(arg0: I1): Unit = ???
}

abstract class A0 extends I1 {
  override def func0(arg0: I1): Unit = {}
}
