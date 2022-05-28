part of fab_rx;

class UiDropdownField<T> extends UiPrimitiveField<T> {
  final IProperty<List<T>> datasource;

  final String? labelText;

  const UiDropdownField({
    Key? key,
    required property,
    required this.datasource,
    this.labelText,
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
      labelText: labelText,
      snapshot: snapshot,
    );
  }
}
