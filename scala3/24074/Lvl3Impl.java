public class Lvl3Impl implements JavaPart.Lvl3 {
    @Override
    public JavaPart.B[] getData() {
        return new JavaPart.B[] { new BImpl() };
    }

    private static class BImpl implements JavaPart.B {
        @Override
        public int onlyInB() {
            return 42;
        }
    }
}
