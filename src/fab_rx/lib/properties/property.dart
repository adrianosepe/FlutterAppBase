part of fab_rx;

class Property<TValue> implements IProperty<TValue> {
  final BehaviorSubject<TValue?> subject = BehaviorSubject<TValue?>();
  final StreamTransformer<TValue?, TValue>? transformer;

  final bool isRequired;

  final String? label;
  final String? hint;

  Property({
    TValue? value,
    this.label,
    this.hint,
    this.isRequired = false,
    this.isReadOnly = false,
    this.transformer,
  }) {
    this.value = value;
  }

  TValue? get value => subject.value;
  set value(TValue? newValue) => subject.value = newValue;

  bool isReadOnly;
  bool get hasValue => value != null;

  Function(TValue?) get setter => subject.sink.add;

  Stream<TValue?> get stream {
    if (transformer == null) {
      return subject.stream;
    }

    return subject.stream.transform(transformer!);
  }

  bool exists() => value != null;
  bool isNull() => value == null;

  void addError(Object error) {
    subject.addError(error);
  }

  Future<void> close() => subject.close();
}
