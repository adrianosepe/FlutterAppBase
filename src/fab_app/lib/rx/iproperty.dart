part of fab_app;

abstract class IProperty<TValue> {
  bool get isRequired;

  String? get label;
  String? get hint;

  TValue? get value;
  set value(TValue? newValue);

  bool get isReadOnly;
  bool get hasValue;

  Function(TValue?) get setter;
  Stream<TValue?> get stream;

  bool exists();
  bool isNull();

  void addError(Object error);
  Future<void> close();
}
