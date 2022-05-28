part of fab_rx;

class UiMaskField extends UiPrimitiveField<String> {
  final controller = MaskedTextController(mask: XString.empty);

  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String mask;

  UiMaskField({
    Key? key,
    required property,
    required this.mask,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
  }) : super(key: key, property: property) {
    controller.mask = this.mask;
  }

  @override
  Widget builder(BuildContext context, AsyncSnapshot<String?> snapshot) {
    controller.value = controller.value.copyWith(text: snapshot.data);

    return ui.render.renderInput(
      context: context,
      property: property,
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      snapshot: snapshot,
    );
  }
}
