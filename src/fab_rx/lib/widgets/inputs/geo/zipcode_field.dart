part of fab_rx;

class UiZipcodeField extends UiPrimitiveField<String> {
  final TextEditingController controller = TextEditingController();

  final String? hintText;

  UiZipcodeField({
    Key? key,
    required property,
    this.hintText,
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
      inputFormatters: MaskTextInputFactory.create(EBusinessData.Zipcode),
      keyboardType: TextInputType.number,
      snapshot: snapshot,
    );
  }
}
