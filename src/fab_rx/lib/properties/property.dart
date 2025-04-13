part of fab_rx;

class Property<TValue> implements IProperty<TValue> {
  final BehaviorSubject<TValue?> subject = BehaviorSubject<TValue?>();
  final StreamTransformer<TValue?, TValue>? transformer;

  @override
  final bool isRequired;

  @override
  final String? label;
  @override
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

  @override
  TValue? get value => subject.value;
  @override
  set value(TValue? newValue) => subject.value = newValue;

  @override
  bool isReadOnly;
  @override
  bool get hasValue => value != null;

  @override
  Function(TValue?) get setter => subject.sink.add;

  @override
  Stream<TValue?> get stream {
    if (transformer == null) {
      return subject.stream;
    }

    return subject.stream.transform(transformer!);
  }

  @override
  bool exists() => value != null;
  @override
  bool isNull() => value == null;

  @override
  void addError(Object error) {
    subject.addError(error);
  }

  @override
  Future<void> close() => subject.close();
}
