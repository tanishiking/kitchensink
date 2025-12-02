Compiled from "JavaPartialFunction.scala"
public class Container<A, B> {
  public Container();
    Code:
         0: aload_0
         1: invokespecial #13                 // Method java/lang/Object."<init>":()V
         4: return
}
Compiled from "JavaPartialFunction.scala"
public abstract class Container$JavaPartialFunction implements scala.PartialFunction<A, B> {
  private final Container $outer;

  public Container$JavaPartialFunction(Container);
    Code:
         0: aload_1
         1: ifnonnull     12
         4: new           #19                 // class java/lang/NullPointerException
         7: dup
         8: invokespecial #22                 // Method java/lang/NullPointerException."<init>":()V
        11: athrow
        12: aload_0
        13: aload_1
        14: putfield      #24                 // Field $outer:LContainer;
        17: aload_0
        18: invokespecial #25                 // Method java/lang/Object."<init>":()V
        21: aload_0
        22: invokestatic  #29                 // InterfaceMethod scala/PartialFunction.$init$:(Lscala/PartialFunction;)V
        25: return

  public scala.Function1 compose(scala.Function1);
    Code:
         0: aload_0
         1: aload_1
         2: invokestatic  #38                 // InterfaceMethod scala/Function1.compose$:(Lscala/Function1;Lscala/Function1;)Lscala/Function1;
         5: areturn

  public java.lang.String toString();
    Code:
         0: aload_0
         1: invokestatic  #45                 // InterfaceMethod scala/Function1.toString$:(Lscala/Function1;)Ljava/lang/String;
         4: areturn

  public void apply$mcVI$sp(int);
    Code:
         0: aload_0
         1: iload_1
         2: invokestatic  #52                 // InterfaceMethod scala/Function1.apply$mcVI$sp$:(Lscala/Function1;I)V
         5: return

  public void apply$mcVJ$sp(long);
    Code:
         0: aload_0
         1: lload_1
         2: invokestatic  #59                 // InterfaceMethod scala/Function1.apply$mcVJ$sp$:(Lscala/Function1;J)V
         5: return

  public void apply$mcVF$sp(float);
    Code:
         0: aload_0
         1: fload_1
         2: invokestatic  #66                 // InterfaceMethod scala/Function1.apply$mcVF$sp$:(Lscala/Function1;F)V
         5: return

  public void apply$mcVD$sp(double);
    Code:
         0: aload_0
         1: dload_1
         2: invokestatic  #73                 // InterfaceMethod scala/Function1.apply$mcVD$sp$:(Lscala/Function1;D)V
         5: return

  public boolean apply$mcZI$sp(int);
    Code:
         0: aload_0
         1: iload_1
         2: invokestatic  #80                 // InterfaceMethod scala/Function1.apply$mcZI$sp$:(Lscala/Function1;I)Z
         5: ireturn

  public boolean apply$mcZJ$sp(long);
    Code:
         0: aload_0
         1: lload_1
         2: invokestatic  #86                 // InterfaceMethod scala/Function1.apply$mcZJ$sp$:(Lscala/Function1;J)Z
         5: ireturn

  public boolean apply$mcZF$sp(float);
    Code:
         0: aload_0
         1: fload_1
         2: invokestatic  #92                 // InterfaceMethod scala/Function1.apply$mcZF$sp$:(Lscala/Function1;F)Z
         5: ireturn

  public boolean apply$mcZD$sp(double);
    Code:
         0: aload_0
         1: dload_1
         2: invokestatic  #98                 // InterfaceMethod scala/Function1.apply$mcZD$sp$:(Lscala/Function1;D)Z
         5: ireturn

  public int apply$mcII$sp(int);
    Code:
         0: aload_0
         1: iload_1
         2: invokestatic  #104                // InterfaceMethod scala/Function1.apply$mcII$sp$:(Lscala/Function1;I)I
         5: ireturn

  public int apply$mcIJ$sp(long);
    Code:
         0: aload_0
         1: lload_1
         2: invokestatic  #110                // InterfaceMethod scala/Function1.apply$mcIJ$sp$:(Lscala/Function1;J)I
         5: ireturn

  public int apply$mcIF$sp(float);
    Code:
         0: aload_0
         1: fload_1
         2: invokestatic  #116                // InterfaceMethod scala/Function1.apply$mcIF$sp$:(Lscala/Function1;F)I
         5: ireturn

  public int apply$mcID$sp(double);
    Code:
         0: aload_0
         1: dload_1
         2: invokestatic  #122                // InterfaceMethod scala/Function1.apply$mcID$sp$:(Lscala/Function1;D)I
         5: ireturn

  public float apply$mcFI$sp(int);
    Code:
         0: aload_0
         1: iload_1
         2: invokestatic  #128                // InterfaceMethod scala/Function1.apply$mcFI$sp$:(Lscala/Function1;I)F
         5: freturn

  public float apply$mcFJ$sp(long);
    Code:
         0: aload_0
         1: lload_1
         2: invokestatic  #134                // InterfaceMethod scala/Function1.apply$mcFJ$sp$:(Lscala/Function1;J)F
         5: freturn

  public float apply$mcFF$sp(float);
    Code:
         0: aload_0
         1: fload_1
         2: invokestatic  #140                // InterfaceMethod scala/Function1.apply$mcFF$sp$:(Lscala/Function1;F)F
         5: freturn

  public float apply$mcFD$sp(double);
    Code:
         0: aload_0
         1: dload_1
         2: invokestatic  #146                // InterfaceMethod scala/Function1.apply$mcFD$sp$:(Lscala/Function1;D)F
         5: freturn

  public long apply$mcJI$sp(int);
    Code:
         0: aload_0
         1: iload_1
         2: invokestatic  #152                // InterfaceMethod scala/Function1.apply$mcJI$sp$:(Lscala/Function1;I)J
         5: lreturn

  public long apply$mcJJ$sp(long);
    Code:
         0: aload_0
         1: lload_1
         2: invokestatic  #158                // InterfaceMethod scala/Function1.apply$mcJJ$sp$:(Lscala/Function1;J)J
         5: lreturn

  public long apply$mcJF$sp(float);
    Code:
         0: aload_0
         1: fload_1
         2: invokestatic  #164                // InterfaceMethod scala/Function1.apply$mcJF$sp$:(Lscala/Function1;F)J
         5: lreturn

  public long apply$mcJD$sp(double);
    Code:
         0: aload_0
         1: dload_1
         2: invokestatic  #170                // InterfaceMethod scala/Function1.apply$mcJD$sp$:(Lscala/Function1;D)J
         5: lreturn

  public double apply$mcDI$sp(int);
    Code:
         0: aload_0
         1: iload_1
         2: invokestatic  #176                // InterfaceMethod scala/Function1.apply$mcDI$sp$:(Lscala/Function1;I)D
         5: dreturn

  public double apply$mcDJ$sp(long);
    Code:
         0: aload_0
         1: lload_1
         2: invokestatic  #182                // InterfaceMethod scala/Function1.apply$mcDJ$sp$:(Lscala/Function1;J)D
         5: dreturn

  public double apply$mcDF$sp(float);
    Code:
         0: aload_0
         1: fload_1
         2: invokestatic  #188                // InterfaceMethod scala/Function1.apply$mcDF$sp$:(Lscala/Function1;F)D
         5: dreturn

  public double apply$mcDD$sp(double);
    Code:
         0: aload_0
         1: dload_1
         2: invokestatic  #194                // InterfaceMethod scala/Function1.apply$mcDD$sp$:(Lscala/Function1;D)D
         5: dreturn

  public scala.Option unapply(java.lang.Object);
    Code:
         0: aload_0
         1: aload_1
         2: invokestatic  #201                // InterfaceMethod scala/PartialFunction.unapply$:(Lscala/PartialFunction;Ljava/lang/Object;)Lscala/Option;
         5: areturn

  public scala.PartialFunction elementWise();
    Code:
         0: aload_0
         1: invokestatic  #208                // InterfaceMethod scala/PartialFunction.elementWise$:(Lscala/PartialFunction;)Lscala/PartialFunction;
         4: areturn

  public scala.PartialFunction orElse(scala.PartialFunction);
    Code:
         0: aload_0
         1: aload_1
         2: invokestatic  #214                // InterfaceMethod scala/PartialFunction.orElse$:(Lscala/PartialFunction;Lscala/PartialFunction;)Lscala/PartialFunction;
         5: areturn

  public scala.PartialFunction andThen(scala.Function1);
    Code:
         0: aload_0
         1: aload_1
         2: invokestatic  #222                // InterfaceMethod scala/PartialFunction.andThen$:(Lscala/PartialFunction;Lscala/Function1;)Lscala/PartialFunction;
         5: areturn

  public scala.PartialFunction andThen(scala.PartialFunction);
    Code:
         0: aload_0
         1: aload_1
         2: invokestatic  #224                // InterfaceMethod scala/PartialFunction.andThen$:(Lscala/PartialFunction;Lscala/PartialFunction;)Lscala/PartialFunction;
         5: areturn

  public scala.PartialFunction compose(scala.PartialFunction);
    Code:
         0: aload_0
         1: aload_1
         2: invokestatic  #226                // InterfaceMethod scala/PartialFunction.compose$:(Lscala/PartialFunction;Lscala/PartialFunction;)Lscala/PartialFunction;
         5: areturn

  public scala.Function1 lift();
    Code:
         0: aload_0
         1: invokestatic  #232                // InterfaceMethod scala/PartialFunction.lift$:(Lscala/PartialFunction;)Lscala/Function1;
         4: areturn

  public scala.Function1 runWith(scala.Function1);
    Code:
         0: aload_0
         1: aload_1
         2: invokestatic  #238                // InterfaceMethod scala/PartialFunction.runWith$:(Lscala/PartialFunction;Lscala/Function1;)Lscala/Function1;
         5: areturn

  public abstract B apply(A, boolean) throws java.lang.Exception;

  public final boolean isDefinedAt(A);
    Code:
         0: getstatic     #254                // Field scala/Predef$.MODULE$:Lscala/Predef$;
         3: invokevirtual #258                // Method scala/Predef$.$qmark$qmark$qmark:()Lscala/runtime/Nothing$;
         6: athrow
         7: athrow

  public final B apply(A);
    Code:
         0: getstatic     #254                // Field scala/Predef$.MODULE$:Lscala/Predef$;
         3: invokevirtual #258                // Method scala/Predef$.$qmark$qmark$qmark:()Lscala/runtime/Nothing$;
         6: athrow
         7: athrow

  public final <A1 extends A, B1> B1 applyOrElse(A1, scala.Function1<A1, B1>);
    Code:
         0: getstatic     #254                // Field scala/Predef$.MODULE$:Lscala/Predef$;
         3: invokevirtual #258                // Method scala/Predef$.$qmark$qmark$qmark:()Lscala/runtime/Nothing$;
         6: athrow
         7: athrow

  public final Container Container$JavaPartialFunction$$$outer();
    Code:
         0: aload_0
         1: getfield      #24                 // Field $outer:LContainer;
         4: areturn

  public scala.Function1 andThen(scala.Function1);
    Code:
         0: aload_0
         1: aload_1
         2: invokevirtual #270                // Method andThen:(Lscala/Function1;)Lscala/PartialFunction;
         5: areturn
}
Compiled from "JavaPartialFunction.scala"
public final class Flow<In, Out> {
  public static <T> Flow<T, T> create();
    Code:
         0: getstatic     #15                 // Field Flow$.MODULE$:LFlow$;
         3: invokevirtual #17                 // Method Flow$.create:()LFlow;
         6: areturn

  public Flow();
    Code:
         0: aload_0
         1: invokespecial #21                 // Method java/lang/Object."<init>":()V
         4: return

  public <T> Flow<In, T> collect(scala.PartialFunction<Out, T>);
    Code:
         0: getstatic     #32                 // Field scala/Predef$.MODULE$:Lscala/Predef$;
         3: invokevirtual #36                 // Method scala/Predef$.$qmark$qmark$qmark:()Lscala/runtime/Nothing$;
         6: athrow
         7: athrow
}
Compiled from "JavaPartialFunction.scala"
public final class Flow$ implements java.io.Serializable {
  public static final Flow$ MODULE$;

  private Flow$();
    Code:
         0: aload_0
         1: invokespecial #13                 // Method java/lang/Object."<init>":()V
         4: return

  public static {};
    Code:
         0: new           #2                  // class Flow$
         3: dup
         4: invokespecial #16                 // Method "<init>":()V
         7: putstatic     #18                 // Field MODULE$:LFlow$;
        10: return

  private java.lang.Object writeReplace();
    Code:
         0: new           #22                 // class scala/runtime/ModuleSerializationProxy
         3: dup
         4: ldc           #2                  // class Flow$
         6: invokespecial #25                 // Method scala/runtime/ModuleSerializationProxy."<init>":(Ljava/lang/Class;)V
         9: areturn

  public <T> Flow<T, T> create();
    Code:
         0: getstatic     #33                 // Field scala/Predef$.MODULE$:Lscala/Predef$;
         3: invokevirtual #37                 // Method scala/Predef$.$qmark$qmark$qmark:()Lscala/runtime/Nothing$;
         6: athrow
         7: athrow
}
Compiled from "JavaTestServer.java"
public class JavaTestServer {
  public JavaTestServer();
    Code:
         0: aload_0
         1: invokespecial #1                  // Method java/lang/Object."<init>":()V
         4: return

  public static Flow<Message, Message> greeter();
    Code:
         0: new           #7                  // class Container
         3: dup
         4: invokespecial #9                  // Method Container."<init>":()V
         7: astore_0
         8: invokestatic  #10                 // Method Flow.create:()LFlow;
        11: new           #16                 // class JavaTestServer$1
        14: dup
        15: aload_0
        16: dup
        17: invokestatic  #18                 // Method java/util/Objects.requireNonNull:(Ljava/lang/Object;)Ljava/lang/Object;
        20: pop
        21: invokespecial #24                 // Method JavaTestServer$1."<init>":(LContainer;)V
        24: invokevirtual #27                 // Method Flow.collect:(Lscala/PartialFunction;)LFlow;
        27: areturn

  public static TextMessage handleTextMessage(TextMessage);
    Code:
         0: aconst_null
         1: areturn
}
Compiled from "JavaTestServer.java"
class JavaTestServer$1 extends Container<Message, Message>.JavaPartialFunction {
  JavaTestServer$1(Container);
    Code:
         0: aload_0
         1: aload_1
         2: dup
         3: invokestatic  #1                  // Method java/util/Objects.requireNonNull:(Ljava/lang/Object;)Ljava/lang/Object;
         6: pop
         7: invokespecial #7                  // Method Container$JavaPartialFunction."<init>":(LContainer;)V
        10: return

  public Message apply(Message, boolean) throws java.lang.Exception;
    Code:
         0: iload_2
         1: ifeq          12
         4: new           #13                 // class java/lang/RuntimeException
         7: dup
         8: invokespecial #15                 // Method java/lang/RuntimeException."<init>":()V
        11: athrow
        12: aload_1
        13: invokevirtual #18                 // Method Message.asTextMessage:()LTextMessage;
        16: invokestatic  #24                 // Method JavaTestServer.handleTextMessage:(LTextMessage;)LTextMessage;
        19: areturn

  public java.lang.Object apply(java.lang.Object, boolean) throws java.lang.Exception;
    Code:
         0: aload_0
         1: aload_1
         2: checkcast     #19                 // class Message
         5: iload_2
         6: invokevirtual #30                 // Method apply:(LMessage;Z)LMessage;
         9: areturn
}
Compiled from "JavaPartialFunction.scala"
public abstract class Message {
  public Message();
    Code:
         0: aload_0
         1: invokespecial #9                  // Method java/lang/Object."<init>":()V
         4: return

  public abstract TextMessage asTextMessage();
}
Compiled from "JavaPartialFunction.scala"
public abstract class TextMessage extends Message {
  public TextMessage();
    Code:
         0: aload_0
         1: invokespecial #9                  // Method Message."<init>":()V
         4: return
}
