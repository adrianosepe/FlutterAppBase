part of fab_lib;

class XIterable {
  static Iterable<Pair<TKey, TValue>> groupBy<TKey, TValue>(Iterable<TValue> values, TKey Function(TValue element) func) sync* {
    var groups = coll.groupBy(values, func);

    for (final g in groups.keys) {
      yield Pair(g, groups[g]!);
    }
  }
}

class Pair<TKey, TValue> {
  final TKey key;
  final List<TValue> value;

  Pair(this.key, this.value);
}
