part of fab_rx;

abstract class BaseBloc {
  final form = Form();

  bool _initiated = false;

  void init() {
    if (_initiated) {
      return;
    }

    _initiated = true;

    internalInit();
  }

  void dispose() => internalDispose();

  void loadDebugValues() => internalLoadDefaultValues();

  @protected
  void internalLoadDefaultValues() {}

  @protected
  void internalInit() {}

  @protected
  void internalDispose() {}
}
