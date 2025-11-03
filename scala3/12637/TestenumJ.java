public class TestenumJ {
    public static void main(String[] args) {
    TestenumS.go();    // line 3 calls Scala to look at Testme
    System.out.println("Java: Testme Hello= " + Testme$.Hello); //=> null, unless line 3 commented, then => Hello
    }
}
