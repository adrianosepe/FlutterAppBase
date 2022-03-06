part of fab_rx;

class EmailProperty extends StringProperty {
  EmailProperty({
    String? label,
    String? hint,
    bool isRequired = false,
  }) : super(
          label: label,
          hint: hint,
          isRequired: isRequired,
          transformer: Transformers.validateEmail,
        );
}
