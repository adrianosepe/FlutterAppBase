part of fab_rx;

class UiNameField extends UiStringField {
  UiNameField({
    Key? key,
    required property,
    String? labelText,
    String? hintText,
  }) : super(
          key: key,
          property: property,
          labelText: labelText,
          hintText: hintText,
          keyboardType: TextInputType.name,
        );
}
