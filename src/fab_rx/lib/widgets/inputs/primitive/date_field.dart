part of fab_rx;

class UiDateField extends UiMaskField {
  UiDateField({
    Key? key,
    required property,
    required hintText,
  }) : super(
          key: key,
          property: property,
          hintText: hintText,
          mask: '00/00/0000',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        );
}
