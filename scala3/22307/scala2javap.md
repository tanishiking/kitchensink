Compiled from "Test.scala"
public abstract class A0 implements Foo$I1 {
  public void func1(java.lang.Object);
    Code:
         0: aload_0
         1: aload_1
         2: invokestatic  #22                 // InterfaceMethod I0.func1$:(LI0;Ljava/lang/Object;)V
         5: return

  public void func0(Foo$I1);
    Code:
         0: return

  public void func0(java.lang.Object);
    Code:
         0: aload_0
         1: aload_1
         2: checkcast     #6                  // class Foo$I1
         5: invokevirtual #30                 // Method func0:(LFoo$I1;)V
         8: return

  public A0();
    Code:
         0: aload_0
         1: invokespecial #34                 // Method java/lang/Object."<init>":()V
         4: aload_0
         5: invokestatic  #38                 // InterfaceMethod I0.$init$:(LI0;)V
         8: return
}
Compiled from "Foo.java"
public class Foo {
  public Foo();
    Code:
         0: aload_0
         1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         4: return
}
Compiled from "Foo.java"
public final class Foo$A1 extends A0 {
  public Foo$A1(Foo);
    Code:
         0: aload_0
         1: invokespecial #1                  // Method A0."<init>":()V
         4: return

  public void func1(java.lang.Object);
    Code:
         0: return
}
Compiled from "Foo.java"
public interface Foo$I1 extends I0<Foo$I1> {
  public default void func0(Foo$I1);
    Code:
         0: new           #1                  // class java/lang/RuntimeException
         3: dup
         4: invokespecial #3                  // Method java/lang/RuntimeException."<init>":()V
         7: athrow

  public default void func0(java.lang.Object);
    Code:
         0: aload_0
         1: aload_1
         2: checkcast     #7                  // class Foo$I1
         5: invokeinterface #9,  2            // InterfaceMethod func0:(LFoo$I1;)V
        10: return
}
Compiled from "Test.scala"
public interface I0<T0> {
  public abstract void func0(T0);

  public static void func1$(I0, java.lang.Object);
    Code:
         0: aload_0
         1: aload_1
         2: invokespecial #19                 // InterfaceMethod func1:(Ljava/lang/Object;)V
         5: return

  public default void func1(java.lang.Object);
    Code:
         0: return

  public static void $init$(I0);
    Code:
         0: return
}
