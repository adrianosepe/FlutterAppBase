part of fab_rx;

class Property<TValue> implements IProperty<TValue> {
  final BehaviorSubject<TValue?> subject = BehaviorSubject<TValue?>();
  final StreamTransformer<TValue, TValue>? transformer;

  final bool isRequired;

  final String? hint;

  Property({
    TValue? value,
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

  Function(TValue?) get setter => subject.sink.add;

  Stream<TValue?> get stream {
    if (transformer == null) {
      return subject.stream;
    }

    return subject.stream.transform(transformer!);
  }

  bool exists() => value != null;
  bool isNull() => value == null;

  close() {
    subject.close();
  }
}
