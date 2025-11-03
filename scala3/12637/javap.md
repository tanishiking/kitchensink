```java
Compiled from "TestenumJ.java"
public class TestenumJ {
  public TestenumJ();
    Code:
       0: aload_0
       1: invokespecial #1                  // Method java/lang/Object."<init>":()V
       4: return

  public static void main(java.lang.String[]);
    Code:
       0: invokestatic  #7                  // Method TestenumS.go:()V
       3: getstatic     #12                 // Field java/lang/System.out:Ljava/io/PrintStream;
       6: getstatic     #18                 // Field Testme.Hello:LTestme;
       9: invokestatic  #24                 // Method java/lang/String.valueOf:(Ljava/lang/Object;)Ljava/lang/String;
      12: invokedynamic #30,  0             // InvokeDynamic #0:makeConcatWithConstants:(Ljava/lang/String;)Ljava/lang/String;
      17: invokevirtual #34                 // Method java/io/PrintStream.println:(Ljava/lang/String;)V
      20: return
}
Compiled from "Testme.scala"
public final class TestenumS {
  public static void go();
    Code:
       0: getstatic     #13                 // Field TestenumS$.MODULE$:LTestenumS$;
       3: invokevirtual #15                 // Method TestenumS$.go:()V
       6: return
}
Compiled from "Testme.scala"
public final class TestenumS$ implements java.io.Serializable {
  public static final TestenumS$ MODULE$;

  private TestenumS$();
    Code:
       0: aload_0
       1: invokespecial #18                 // Method java/lang/Object."<init>":()V
       4: return

  public static {};
    Code:
       0: new           #2                  // class TestenumS$
       3: dup
       4: invokespecial #21                 // Method "<init>":()V
       7: putstatic     #23                 // Field MODULE$:LTestenumS$;
      10: return

  private java.lang.Object writeReplace();
    Code:
       0: new           #27                 // class scala/runtime/ModuleSerializationProxy
       3: dup
       4: ldc           #2                  // class TestenumS$
       6: invokespecial #30                 // Method scala/runtime/ModuleSerializationProxy."<init>":(Ljava/lang/Class;)V
       9: areturn

  public void go();
    Code:
       0: getstatic     #36                 // Field scala/Predef$.MODULE$:Lscala/Predef$;
       3: getstatic     #42                 // Field Testme$.Hello:LTestme;
       6: invokedynamic #54,  0             // InvokeDynamic #0:makeConcatWithConstants:(LTestme;)Ljava/lang/String;
      11: invokevirtual #58                 // Method scala/Predef$.println:(Ljava/lang/Object;)V
      14: return
}
Compiled from "Testme.scala"
public abstract class Testme extends java.lang.Enum<Testme> implements scala.reflect.Enum {
  public static final Testme Hello;

  public static Testme fromOrdinal(int);
    Code:
       0: getstatic     #20                 // Field Testme$.MODULE$:LTestme$;
       3: iload_0
       4: invokevirtual #22                 // Method Testme$.fromOrdinal:(I)LTestme;
       7: areturn

  public static Testme valueOf(java.lang.String);
    Code:
       0: getstatic     #20                 // Field Testme$.MODULE$:LTestme$;
       3: aload_0
       4: invokevirtual #26                 // Method Testme$.valueOf:(Ljava/lang/String;)LTestme;
       7: areturn

  public static Testme[] values();
    Code:
       0: getstatic     #20                 // Field Testme$.MODULE$:LTestme$;
       3: invokevirtual #30                 // Method Testme$.values:()[LTestme;
       6: areturn

  public Testme(java.lang.String, int);
    Code:
       0: aload_0
       1: aload_1
       2: iload_2
       3: invokespecial #36                 // Method java/lang/Enum."<init>":(Ljava/lang/String;I)V
       6: return

  private static {};
    Code:
       0: getstatic     #43                 // Field Testme$.Hello:LTestme;
       3: putstatic     #44                 // Field Hello:LTestme;
       6: return

  public scala.collection.Iterator productIterator();
    Code:
       0: aload_0
       1: invokestatic  #50                 // InterfaceMethod scala/Product.productIterator$:(Lscala/Product;)Lscala/collection/Iterator;
       4: areturn

  public java.lang.String productPrefix();
    Code:
       0: aload_0
       1: invokestatic  #56                 // InterfaceMethod scala/Product.productPrefix$:(Lscala/Product;)Ljava/lang/String;
       4: areturn

  public java.lang.String productElementName(int);
    Code:
       0: aload_0
       1: iload_1
       2: invokestatic  #63                 // InterfaceMethod scala/Product.productElementName$:(Lscala/Product;I)Ljava/lang/String;
       5: areturn

  public scala.collection.Iterator productElementNames();
    Code:
       0: aload_0
       1: invokestatic  #67                 // InterfaceMethod scala/Product.productElementNames$:(Lscala/Product;)Lscala/collection/Iterator;
       4: areturn
}
Compiled from "Testme.scala"
public final class Testme$ implements scala.deriving.Mirror$Sum,java.io.Serializable {
  public static final Testme Hello;

  private static final Testme[] $values;

  public static final Testme$ MODULE$;

  private Testme$();
    Code:
       0: aload_0
       1: invokespecial #29                 // Method java/lang/Object."<init>":()V
       4: return

  public static {};
    Code:
       0: new           #2                  // class Testme$
       3: dup
       4: invokespecial #32                 // Method "<init>":()V
       7: putstatic     #34                 // Field MODULE$:LTestme$;
      10: getstatic     #34                 // Field MODULE$:LTestme$;
      13: iconst_0
      14: ldc           #35                 // String Hello
      16: invokespecial #39                 // Method $new:(ILjava/lang/String;)LTestme;
      19: putstatic     #41                 // Field Hello:LTestme;
      22: iconst_1
      23: anewarray     #43                 // class Testme
      26: dup
      27: iconst_0
      28: getstatic     #34                 // Field MODULE$:LTestme$;
      31: pop
      32: getstatic     #41                 // Field Hello:LTestme;
      35: aastore
      36: checkcast     #44                 // class "[LTestme;"
      39: putstatic     #46                 // Field $values:[LTestme;
      42: return

  private java.lang.Object writeReplace();
    Code:
       0: new           #50                 // class scala/runtime/ModuleSerializationProxy
       3: dup
       4: ldc           #2                  // class Testme$
       6: invokespecial #53                 // Method scala/runtime/ModuleSerializationProxy."<init>":(Ljava/lang/Class;)V
       9: areturn

  public Testme[] values();
    Code:
       0: getstatic     #46                 // Field $values:[LTestme;
       3: invokevirtual #58                 // Method "[LTestme;".clone:()Ljava/lang/Object;
       6: checkcast     #44                 // class "[LTestme;"
       9: areturn

  public Testme valueOf(java.lang.String);
    Code:
       0: aload_1
       1: astore_2
       2: ldc           #35                 // String Hello
       4: aload_2
       5: invokevirtual #65                 // Method java/lang/Object.equals:(Ljava/lang/Object;)Z
       8: ifeq          17
      11: aload_0
      12: pop
      13: getstatic     #41                 // Field Hello:LTestme;
      16: areturn
      17: new           #67                 // class java/lang/IllegalArgumentException
      20: dup
      21: aload_1
      22: invokedynamic #79,  0             // InvokeDynamic #0:makeConcatWithConstants:(Ljava/lang/String;)Ljava/lang/String;
      27: invokespecial #82                 // Method java/lang/IllegalArgumentException."<init>":(Ljava/lang/String;)V
      30: athrow

  private Testme $new(int, java.lang.String);
    Code:
       0: new           #11                 // class Testme$$anon$1
       3: dup
       4: aload_2
       5: iload_1
       6: invokespecial #89                 // Method Testme$$anon$1."<init>":(Ljava/lang/String;I)V
       9: areturn

  public Testme fromOrdinal(int);
    Code:
       0: getstatic     #46                 // Field $values:[LTestme;
       3: iload_1
       4: aaload
       5: goto          32
       8: pop
       9: new           #97                 // class java/util/NoSuchElementException
      12: dup
      13: iload_1
      14: invokestatic  #103                // Method scala/runtime/BoxesRunTime.boxToInteger:(I)Ljava/lang/Integer;
      17: invokevirtual #109                // Method java/lang/Integer.toString:()Ljava/lang/String;
      20: invokedynamic #112,  0            // InvokeDynamic #1:makeConcatWithConstants:(Ljava/lang/String;)Ljava/lang/String;
      25: invokespecial #113                // Method java/util/NoSuchElementException."<init>":(Ljava/lang/String;)V
      28: athrow
      29: nop
      30: nop
      31: athrow
      32: areturn
    Exception table:
       from    to  target type
           0     5     8   Class java/lang/Throwable

  public int ordinal(Testme);
    Code:
       0: aload_1
       1: invokevirtual #118                // Method Testme.ordinal:()I
       4: ireturn

  public int ordinal(java.lang.Object);
    Code:
       0: aload_0
       1: aload_1
       2: checkcast     #43                 // class Testme
       5: invokevirtual #122                // Method ordinal:(LTestme;)I
       8: ireturn
}
Compiled from "Testme.scala"
public final class Testme$$anon$1 extends Testme implements scala.runtime.EnumValue,scala.deriving.Mirror$Singleton {
  public Testme$$anon$1(java.lang.String, int);
    Code:
       0: aload_0
       1: aload_1
       2: iload_2
       3: invokespecial #20                 // Method Testme."<init>":(Ljava/lang/String;I)V
       6: return

  public boolean canEqual(java.lang.Object);
    Code:
       0: aload_0
       1: aload_1
       2: invokestatic  #31                 // InterfaceMethod scala/runtime/EnumValue.canEqual$:(Lscala/runtime/EnumValue;Ljava/lang/Object;)Z
       5: ireturn

  public int productArity();
    Code:
       0: aload_0
       1: invokestatic  #38                 // InterfaceMethod scala/runtime/EnumValue.productArity$:(Lscala/runtime/EnumValue;)I
       4: ireturn

  public java.lang.Object productElement(int);
    Code:
       0: aload_0
       1: iload_1
       2: invokestatic  #45                 // InterfaceMethod scala/runtime/EnumValue.productElement$:(Lscala/runtime/EnumValue;I)Ljava/lang/Object;
       5: areturn

  public java.lang.String productElementName(int);
    Code:
       0: aload_0
       1: iload_1
       2: invokestatic  #51                 // InterfaceMethod scala/runtime/EnumValue.productElementName$:(Lscala/runtime/EnumValue;I)Ljava/lang/String;
       5: areturn

  public scala.deriving.Mirror$Singleton fromProduct(scala.Product);
    Code:
       0: aload_0
       1: aload_1
       2: invokestatic  #58                 // InterfaceMethod scala/deriving/Mirror$Singleton.fromProduct$:(Lscala/deriving/Mirror$Singleton;Lscala/Product;)Lscala/deriving/Mirror$Singleton;
       5: areturn

  public java.lang.String productPrefix();
    Code:
       0: aload_0
       1: invokevirtual #64                 // Method name:()Ljava/lang/String;
       4: areturn

  public java.lang.Object fromProduct(scala.Product);
    Code:
       0: aload_0
       1: aload_1
       2: invokevirtual #67                 // Method fromProduct:(Lscala/Product;)Lscala/deriving/Mirror$Singleton;
       5: areturn
}
```
