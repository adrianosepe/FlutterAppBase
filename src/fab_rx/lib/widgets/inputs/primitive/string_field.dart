part of fab_rx;

class UiStringField extends UiPrimitiveField<String> {
  final TextEditingController controller = TextEditingController();

  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  UiStringField({
    required property,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
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
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      snapshot: snapshot,
    );
  }
}
