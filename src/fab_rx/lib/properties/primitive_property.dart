part of fab_rx;

class DateTimeProperty extends Property<DateTime> {
  DateTimeProperty({
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
  }) : super(
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
        );
}

class StringProperty extends Property<String> implements IMaxLenght {
  int? maxLength;
  StringProperty({
    String? value,
    String? label,
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
    this.maxLength,
    transformer,
  }) : super(
          value: value,
          label: label,
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );
}

class IntProperty extends Property<int> {
  IntProperty({
    int? value,
    String? label,
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
    transformer,
  }) : super(
          value: value,
          label: label,
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );
}

class DoubleProperty extends Property<double> {
  DoubleProperty({
    double? value,
    String? label,
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
    transformer,
  }) : super(
          value: value,
          label: label,
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );
}

class BoolProperty extends Property<bool> {
  BoolProperty({
    bool? value,
    String? label,
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
    transformer,
  }) : super(
          value: value,
          label: label,
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );
}
