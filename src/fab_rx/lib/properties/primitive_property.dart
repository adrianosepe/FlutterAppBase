part of fab_rx;

class DateTimeProperty extends StringProperty {
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

class StringProperty extends Property<String> {
  StringProperty({
    String? value,
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
    transformer,
  }) : super(
          value: value,
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );
}

class IntProperty extends Property<int> {
  IntProperty({
    int? value,
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
    transformer,
  }) : super(
          value: value,
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );
}

class DoubleProperty extends Property<double> {
  DoubleProperty({
    double? value,
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
    transformer,
  }) : super(
          value: value,
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );
}

class BoolProperty extends Property<bool> {
  BoolProperty({
    bool? value,
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
    transformer,
  }) : super(
          value: value,
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );
}