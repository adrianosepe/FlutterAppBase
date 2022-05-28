part of fab_rx;

class EmailProperty extends StringProperty {
  EmailProperty({
    String? label = 'E-mail',
    String? hint = 'meuemail@email.com',
    bool isRequired = false,
  }) : super(
          label: label,
          hint: hint,
          isRequired: isRequired,
          transformer: Transformers.validateEmail,
        );
}
