part of fab_app;

abstract class BaseEnvironment<TNav extends INavigation, TUiSettings extends IUiSettings, THdi extends IHdi>
    implements IEnvironment {
  late TNav _nav;
  late TUiSettings _ui;
  late THdi _hdi;

  @override
  TNav get nav => _nav;
  @override
  TUiSettings get ui => _ui;
  @override
  THdi get hdi => _hdi;

  Future<void> init() async {
    BaseContext.init(this);

    _nav = await internalCreateNavigation();
    _ui = await internalCreateUiSettings();
    _hdi = await internalCreateHdi();

    await internalInitialize();
  }

  Future<TNav> internalCreateNavigation();

  Future<TUiSettings> internalCreateUiSettings();

  Future<THdi> internalCreateHdi();

  Future<void> internalInitialize();
}
