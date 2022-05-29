part of fab_app;

abstract class BaseContext {
  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  static late IEnvironment _evt;

  static BuildContext get currentContext => navigatorKey.currentContext!;
  static IEnvironment get currentEvt => _evt;

  BuildContext get context => currentContext;
  IEnvironment get evt => currentEvt;
  INavigation get nav => evt.nav;
  IUiSettings get ui => evt.ui;
  IHdi get hdi => evt.hdi;

  static void init(IEnvironment evt) {
    _evt = evt;
  }
}
