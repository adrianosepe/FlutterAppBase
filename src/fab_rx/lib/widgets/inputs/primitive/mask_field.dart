part of fab_rx;

class UiMaskField extends UiPrimitiveField<String> {
  final String? hintText;
  final String mask;

  final TextEditingController controller = TextEditingController();

  UiMaskField({
    required property,
    required this.mask,
    this.hintText,
    Key? key,
  }) : super(
          key: key,
          property: property,
        );

  @override
  Widget builder(BuildContext context, AsyncSnapshot<String?> snapshot) {
    controller.value = controller.value.copyWith(text: snapshot.data);

    return ui.render.renderInput(
      context: context,
      property: property,
      hintText: hintText,
      controller: controller,
      inputFormatters: [
        MaskTextInputFactory.createCustom(mask),
      ],
      keyboardType: TextInputType.number,
      snapshot: snapshot,
    );
  }
}
