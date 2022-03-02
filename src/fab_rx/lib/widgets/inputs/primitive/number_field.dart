part of fab_rx;

class UiNumberField extends UiPrimitiveField<String> {
  final String? hintText;
  final bool isCurrency;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller = TextEditingController();

  UiNumberField({
    Key? key,
    required property,
    this.hintText,
    this.inputFormatters,
    this.isCurrency = false,
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
      keyboardType: TextInputType.number,
      snapshot: snapshot,
    );
  }
}
