part of fab_rx;

class StreamSetState {
  final _property = Property<int>(value: 0);

  Stream get stream => _property.stream;

  Future<void> setState() => Future.value(_property.value = _property.value! + 1);
}
