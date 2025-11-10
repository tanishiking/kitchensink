public class JavaImpl implements Lvl2 {
    private final ScalaImpl delegate;
    public JavaImpl(ScalaImpl delegate) {
        this.delegate = delegate;
    }
    @Override
    public B[] getData() {
        return delegate.getDataImpl();
    }
}
