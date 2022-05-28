part of fab_rx;

class UiSelectorField<T> extends UiPrimitiveField<T> {
  final IProperty<List<T>> datasource;

  final String? labelText;
  final String? hintText;
  final bool isSearchable;

  const UiSelectorField({
    Key? key,
    required property,
    required this.datasource,
    this.isSearchable = true,
    this.labelText,
    this.hintText,
  }) : super(
          key: key,
          property: property,
        );

  @override
  Widget builder(BuildContext context, AsyncSnapshot<T?> snapshot) {
    return ui.render.renderSelector(
      context: context,
      property: property,
      datasource: datasource,
      labelText: labelText,
      hintText: hintText,
      isSearchable: isSearchable,
      snapshot: snapshot,
    );
  }
}
