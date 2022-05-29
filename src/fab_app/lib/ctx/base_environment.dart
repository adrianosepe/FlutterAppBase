part of fab_app;

abstract class BaseEnvironment<TNav extends INavigation, TUiSettings extends IUiSettings, THdi extends IHdi> implements IEnvironment {
  late TNav _nav;
  late TUiSettings _ui;
  late THdi _hdi;

  TNav get nav => _nav;
  TUiSettings get ui => _ui;
  THdi get hdi => _hdi;

  Future<void> init() async {
    BaseContext.init(this);

    _nav = await internalCreateNavigation();
    _ui = await internalCreateUiSettings();
    _hdi = await internalCreateHdi();

    await internalInitialize();
  }

  @protected
  Future<TNav> internalCreateNavigation();

  @protected
  Future<TUiSettings> internalCreateUiSettings();

  @protected
  Future<THdi> internalCreateHdi();

  @protected
  Future<void> internalInitialize();
}
