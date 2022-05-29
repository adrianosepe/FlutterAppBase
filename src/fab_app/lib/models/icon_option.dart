part of fab_app;

class IconOption<TValue> {
  final TValue value;
  final IconData icon;
  final String text;

  IconOption(this.value, this.icon, this.text);

  @override
  String toString() => this.text;
}
