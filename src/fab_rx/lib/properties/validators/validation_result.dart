part of fab_rx;

class ValidationResult {
  var _errors = <String>[];

  void add(String error) {
    _errors.add(error);
  }

  bool get success => _errors.length == 0;

  ValidationResult check<T>(
    Property<T> property, {
    Func1<T, String>? what,
  }) {
    ModelValidators.check<T>(
      property,
      what,
      validationResult: this,
    );

    return this;
  }

  ValidationResult checkIf<T>(
    Property<T> property,
    Func<bool> predicate, {
    Func1<T, String>? what,
  }) {
    if (!predicate()) {
      return this;
    }

    ModelValidators.check<T>(
      property,
      what,
      validationResult: this,
    );

    return this;
  }

  bool fail() => !success;

  @override
  String toString() => _errors.join(",\n");
}

extension ValidationResultExtensions on ValidationResult {
  ValidationResult check<T>(
    Property<T> property,
    Func1<T, String> funCheck,
  ) {
    ModelValidators.check<T>(
      property,
      funCheck,
      validationResult: this,
    );

    return this;
  }
}
