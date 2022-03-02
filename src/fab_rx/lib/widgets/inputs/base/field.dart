part of fab_rx;

abstract class UiField<T, TProp extends Property<T>> extends UiView {
  final TProp property;

  const UiField({
    Key? key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) => StreamBuilder(stream: property.stream, builder: this.builder);

  Widget builder(BuildContext context, AsyncSnapshot<T?> snapshot);
}
