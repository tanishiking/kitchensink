import JavaPart._

object Test {
  def main(args: Array[String]): Unit =
    test(new Lvl3Impl)

  def test(lvl3: Lvl3): Unit = {
    println(lvl3.getData().head.onlyInB())
  }
}
