part of fab_rx;

class DateTimeProperty extends StringProperty {
  DateTimeProperty({
    bool isRequired = false,
    bool isReadOnly = false,
  }) : super(
          isRequired: isRequired,
          isReadOnly: isReadOnly,
        );
}

class StringProperty extends Property<String> {
  StringProperty({
    String? value,
    bool isRequired = false,
    bool isReadOnly = false,
    transformer,
  }) : super(
          value: value,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );
}

class IntProperty extends Property<int> {
  IntProperty({
    int? value,
    bool isRequired = false,
    bool isReadOnly = false,
    transformer,
  }) : super(
          value: value,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );
}

class DoubleProperty extends Property<double> {
  DoubleProperty({
    double? value,
    bool isRequired = false,
    bool isReadOnly = false,
    transformer,
  }) : super(
          value: value,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );
}

class BoolProperty extends Property<bool> {
  BoolProperty({
    bool? value,
    bool isRequired = false,
    bool isReadOnly = false,
    transformer,
  }) : super(
          value: value,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );
}
