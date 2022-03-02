part of fab_rx;

class Form {
  final _properties = <Property>[];

  bool _isReadOnly = false;

  Form add(Property property) {
    _properties.add(property);

    return this;
  }

  Form addAll(Iterable<Property> properties) {
    _properties.addAll(properties);

    return this;
  }

  void internalIsReadOnlyChanged() {
    final rd = _isReadOnly;
    for (final p in _properties) {
      p.isReadOnly = rd;
    }
  }

  bool get isReadOnly => _isReadOnly;
  set isReadOnly(bool value) {
    if (_isReadOnly == value) {
      return;
    }

    _isReadOnly = value;

    internalIsReadOnlyChanged();
  }
}
