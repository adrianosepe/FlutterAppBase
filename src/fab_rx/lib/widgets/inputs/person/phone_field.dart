part of fab_rx;

class UiPhoneField extends UiPrimitiveField<String> {
  final String hintText;
  final bool isCellphone;

  final TextEditingController controller = TextEditingController();

  UiPhoneField({
    required property,
    required this.hintText,
    this.isCellphone = false,
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
        MaskTextInputFactory.create(isCellphone ? EBusinessData.CellPhone : EBusinessData.Phone),
      ],
      keyboardType: TextInputType.number,
      snapshot: snapshot,
    );
  }
}
