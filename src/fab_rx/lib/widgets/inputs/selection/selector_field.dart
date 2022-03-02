part of fab_rx;

class UiSelectorField<T> extends UiPrimitiveField<T> {
  final String? hintText;
  final String placeholder;
  final IProperty<List<T>> datasource;

  const UiSelectorField({
    Key? key,
    required property,
    required this.datasource,
    this.hintText,
    this.placeholder = 'Selecione...',
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
