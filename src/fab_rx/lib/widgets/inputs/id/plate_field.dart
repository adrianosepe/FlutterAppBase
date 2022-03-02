part of fab_rx;

class UiPlateField extends UiPrimitiveField<String> {
  final String? hintText;

  final TextEditingController controller = TextEditingController();

  UiPlateField({
    required property,
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
        MaskTextInputFactory.create(EBusinessData.Plate),
      ],
      keyboardType: TextInputType.number,
      snapshot: snapshot,
    );
  }
}
