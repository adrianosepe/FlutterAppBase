part of fab_lib;

class JsonStoreProperty<T> {
  final String name;
  final KeyValueStore _store;
  final T? defValue;

  final Func1<T, String> toJson;
  final Func1<String?, T?> fromJson;

  JsonStoreProperty(this._store, this.name, this.toJson, this.fromJson, {this.defValue});

  T? get value => XFlow.tryGet<T?>(
        () {
          final s = _store.getString(name);
          if (s == null) {
            return defValue;
          }

          return fromJson(s);
        },
      );
  set value(T? v) => XFlow.ensure(
        () {
          final s = toJson(v!);

          _store.setString(name, s);
        },
      );
}
