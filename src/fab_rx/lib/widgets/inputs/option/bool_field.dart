part of fab_rx;

class UiBoolField extends UiPrimitiveField<bool> {
  final String hintText;

  const UiBoolField({
    required property,
    required this.hintText,
    Key? key,
  }) : super(
          key: key,
          property: property,
        );

  @override
  Widget builder(BuildContext context, AsyncSnapshot<bool?> snapshot) {
    return ui.render.renderSwitch(
      context: context,
      property: property,
      hintText: hintText,
      snapshot: snapshot,
    );
  }
}
