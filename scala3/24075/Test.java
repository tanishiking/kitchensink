public class Test {
  public static void main(String[] args) {
    JavaImpl impl = new JavaImpl(new ScalaImpl());
    impl.getData();
  }
}
