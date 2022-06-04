part of fab_rx;

abstract class BaseBloc extends BaseContext {
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

  @protected
  List<Property> internalFormProperties();

  Future<T> executeWithBusyIndicator<T>(Func<Future<T>> realAction) async {
    hdi.showProgress(message: 'Por favor espere...');

    try {
      return await realAction();
    } finally {
      hdi.hideProgress();
    }
  }
}

abstract class DynamicBaseBloc extends BaseBloc {
  Future<void> reload();
}
