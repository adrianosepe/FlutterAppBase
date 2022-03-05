part of fab_rx;

class UiZipcodeField extends UiMaskField {
  UiZipcodeField({
    Key? key,
    required property,
    String? hintText,
  }) : super(
          key: key,
          property: property,
          hintText: hintText,
          mask: '00.000-000',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        );
}
