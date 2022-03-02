part of fab_rx;

class UiDocField extends UiPrimitiveField<String> {
  final TextEditingController controller = TextEditingController();

  final EDocType docType;
  final String? hintText;

  UiDocField({
    Key? key,
    required property,
    required this.docType,
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
      inputFormatters: [
        MaskTextInputFactory.createForDocType(docType),
      ],
      keyboardType: TextInputType.number,
      snapshot: snapshot,
    );
  }
}
