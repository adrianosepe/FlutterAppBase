part of fab_lib;

class DateTimeStoreProperty {
  final String name;
  final KeyValueStore _store;
  final DateTime? defValue;

  DateTimeStoreProperty(this._store, this.name, {this.defValue});

  DateTime? get value => _store.getDateTime(name, defValue: defValue);
  set value(DateTime? v) => _store.setDateTime(name, v!);
}
