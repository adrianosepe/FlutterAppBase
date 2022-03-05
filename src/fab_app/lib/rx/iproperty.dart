part of fab_app;

abstract class IProperty<TValue> {
  String? get label;
  String? get hint;
  Function(TValue?) get setter;
  Stream<TValue?> get stream;
  bool get isReadOnly;
}
