part of fab_app;

abstract class IProperty<TValue> {
  String? get label;
  String? get hint;
  TValue? get value;
  set value(TValue? newValue);
  Function(TValue?) get setter;
  Stream<TValue?> get stream;
  bool get isReadOnly;
}
