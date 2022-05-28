part of fab_rx;

abstract class UiPrimitiveField<T> extends UiField<T, Property<T>> {
  const UiPrimitiveField({
    Key? key,
    required property,
  }) : super(property: property);
}
