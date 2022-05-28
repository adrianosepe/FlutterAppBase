part of fab_rx;

class UiEmailField extends UiStringField {
  UiEmailField({
    Key? key,
    required property,
    String? labelText,
    String? hintText,
  }) : super(
          key: key,
          property: property,
          labelText: labelText,
          hintText: hintText,
          keyboardType: TextInputType.emailAddress,
        );
}
