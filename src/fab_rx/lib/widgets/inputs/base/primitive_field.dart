part of fab_rx;

abstract class UiPrimitiveField<T> extends UiField<T, Property<T>> {
  const UiPrimitiveField({
    super.key,
    required super.property,
  });
}
