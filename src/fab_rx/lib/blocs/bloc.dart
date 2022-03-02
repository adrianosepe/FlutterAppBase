part of fab_rx;

abstract class BaseBloc {
  final form = Form();

  void init() {
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
