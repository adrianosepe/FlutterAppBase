part of fab_rx;

class UiDropdownField<T> extends UiPrimitiveField<T> {
  final Map<T, String> options;
  final String? hintText;

  const UiDropdownField({
    Key? key,
    required property,
    required this.options,
    this.hintText,
  }) : super(
          key: key,
          property: property,
        );

  @override
  Widget builder(BuildContext context, AsyncSnapshot<T?> snapshot) {
    return ui.render.renderDropdown<T>(
      context: context,
      property: property,
      hintText: hintText,
      options: options,
      snapshot: snapshot,
    );
  }
}
