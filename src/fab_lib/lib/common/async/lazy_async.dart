part of fab_lib;

class LazyAsync<T> {
  final Func<Future<T>> _func;

  bool _isEvaluated = false;
  T _value;

  LazyAsync(this._func);

  Future<T> get value async {
    if (!_isEvaluated) {
      if (_func != null) {
        _value = await _func();
      }

      _isEvaluated = true;
    }

    return _value;
  }

  void reset() {
    _isEvaluated = false;
  }
}
