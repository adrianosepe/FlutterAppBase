part of fab_rx;

class StreamSetState {
  final _property = Property<int>(value: 0);

  Stream get stream => _property.stream;

  Future<void> setState() {
    _property.value = (_property.value ?? 0) + 1;

    return Future.value();
  }
}
