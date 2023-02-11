part of fab_app;

class Option<TKey> {
  final TKey id;
  final String description;

  Option(this.id, this.description);

  @override
  String toString() => this.description;
}
