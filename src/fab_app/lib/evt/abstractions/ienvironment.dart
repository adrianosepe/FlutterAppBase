part of fab_app;

abstract class IEnvironment {
  INavigation get nav;
  IUiSettings get ui;
  IHdi get hdi;

  bool get inAuthSession;
  String? get userToken;
}
