part of fab_rx;

class UiDropdownField<T> extends UiPrimitiveField<T> {
  final IProperty<List<T>> datasource;
  final String? hintText;

  const UiDropdownField({
    Key? key,
    required property,
    required this.datasource,
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
      datasource: datasource,
      hintText: hintText,
      snapshot: snapshot,
    );
  }
}
