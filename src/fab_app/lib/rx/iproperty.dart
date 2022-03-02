part of fab_app;

abstract class IProperty<TValue> {
  Function(TValue?) get setter;
  Stream<TValue?> get stream;
  bool get isReadOnly;
}
