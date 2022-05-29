part of fab_app;

class Option {
  final int id;
  final String description;

  Option(this.id, this.description);

  @override
  String toString() => this.description;
}
