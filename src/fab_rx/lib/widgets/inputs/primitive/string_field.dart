part of fab_rx;

class UiStringField extends UiPrimitiveField<String> {
  final TextEditingController controller = TextEditingController();

  final String? labelText;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String obscuringCharacter;

  UiStringField({
    Key? key,
    required property,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.obscuringCharacter = '*',
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
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      snapshot: snapshot,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
    );
  }
}
