part of fab_rx;

class UiSelectorField<T> extends UiPrimitiveField<T> {
  final IProperty<List<T>> datasource;
  final String? hintText;

  const UiSelectorField({
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
    return ui.render.renderSelector(
      context: context,
      property: property,
      datasource: datasource,
      hintText: hintText,
      snapshot: snapshot,
    );
  }
}
