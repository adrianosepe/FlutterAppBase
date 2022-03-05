import 'package:fab_rx/fab_rx.dart';

class CollectionProperty<TItem> extends Property<List<TItem>> {
  List<TItem> get _secItems => super.value ?? <TItem>[];

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

  int get length => _secItems.length;

  void add(TItem item) {
    final items = List<TItem>.from(_secItems)..add(item);

    value = items;
  }

  bool remove(TItem item) {
    final removed = _secItems.remove(item);
    if (!removed) {
      return false;
    }

    final items = List<TItem>.from(_secItems);

    value = items;

    return true;
  }

  void clear() {
    value = <TItem>[];
  }
}
