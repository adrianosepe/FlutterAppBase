part of fab_rx;

class CollectionProperty<TItem> extends Property<List<TItem>> {
  List<TItem> get _items => super.value ?? <TItem>[];

  CollectionProperty({
    List<TItem>? value,
    String? label,
    String? hint,
    bool isRequired = false,
    bool isReadOnly = false,
    transformer,
  }) : super(
          value: value,
          label: label,
          hint: hint,
          isRequired: isRequired,
          isReadOnly: isReadOnly,
          transformer: transformer,
        );

  int get length => _items.length;

  void add(TItem item) {
    final items = List<TItem>.from(_items)..add(item);

    value = items;
  }

  void addAll(Iterable<TItem> items) {
    final news = List<TItem>.from(_items)..addAll(items);

    value = news;
  }

  void replace(Iterable<TItem>? items) {
    value = items?.toList() ?? <TItem>[];
  }

  bool remove(TItem item) {
    final removed = _items.remove(item);
    if (!removed) {
      return false;
    }

    final items = List<TItem>.from(_items);

    value = items;

    return true;
  }

  void clear() {
    value = <TItem>[];
  }
}
