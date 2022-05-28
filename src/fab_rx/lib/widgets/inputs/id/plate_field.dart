part of fab_rx;

class UiPlateField extends UiMaskField {
  UiPlateField({
    Key? key,
    required property,
    String? hintText,
  }) : super(key: key, property: property, mask: 'AAA-0@000', hintText: hintText);
}
