trait A:
  def name: String = "A"

trait B extends A:
  override def name: String = "B"

trait C extends A:
  override def name: String = "C"

class Test1 extends A with C with B

// Test2 -> C -> B -> a
class Test2 extends A with B with C

trait Base:
  def value: Int = 0

trait Left extends Base:
  override def value: Int = 1

trait Right extends Base:
  override def value: Int = 2

// Linearization: Diamond1 -> Right -> Left -> Base
class Diamond1 extends Base with Left with Right

class Diamond2 extends Base with Right with Left

// 線形化チェーン
trait T1 { def id = "T1" }
trait T2 extends T1 { override def id = "T2" }
trait T3 extends T2 { override def id = "T3" }
trait T4 extends T1 { override def id = "T4" }

// Complex -> T4 -> T3 -> T2 -> T1
class Complex extends T3 with T4


@main def main() =
  println(s"Test1.name = ${new Test1().name}")  // "B"
  println(s"Test2.name = ${new Test2().name}")  // "C"
  println(s"Diamond1.value = ${new Diamond1().value}")  // 2
  println(s"Diamond2.value = ${new Diamond2().value}")  // 1
  println(s"Complex.id = ${new Complex().id}")  // "T4"
  
  println("\nLInearization order:")
  println(s"Test1: ${classOf[Test1].getInterfaces.map(_.getSimpleName).mkString(", ")}")
  println(s"Test2: ${classOf[Test2].getInterfaces.map(_.getSimpleName).mkString(", ")}")
