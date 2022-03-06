part of fab_lib;

class StringStoreProperty {
  final KeyValueStore _store;

  final String name;
  final String defValue;

  StringStoreProperty(this._store, this.name, {this.defValue = ''});

  String get value => _store.getString(name, defValue: defValue)!;
  set value(String v) => _store.setString(name, v);
}
