part of fab_rx;

abstract class UiPrimitiveField<T> extends UiField<T, Property<T>> {
  const UiPrimitiveField({
    required property,
    Key? key,
  }) : super(property: property);
}