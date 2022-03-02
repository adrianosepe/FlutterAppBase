part of fab_rx;

class UiDocField extends UiPrimitiveField<String> {
  final String hintText;
  final EDocType docType;
  final TextEditingController controller = TextEditingController();

  UiDocField({
    required property,
    required this.hintText,
    required this.docType,
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
        MaskTextInputFactory.createForDocType(docType),
      ],
      keyboardType: TextInputType.number,
      snapshot: snapshot,
    );
  }
}
