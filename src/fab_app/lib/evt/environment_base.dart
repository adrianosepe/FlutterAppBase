part of fab_app;

abstract class EnvironmentBase {
  static Func<EnvironmentBase> _funcGetInstance;
  static Lazy<EnvironmentBase> _lazyInstance = Lazy(() => _funcGetInstance());

  KeyValueStore _mruStore;

  ESessionState _sessionState = ESessionState.Starting;
  ISession _session;
  JsonStoreProperty<ISession> _sessionStore;

  AppTheme _theme;
  AppParameters _parameters;

  String _appTile;

  @protected
  EnvironmentBase(String appTile) {
    _appTile = appTile;
  }

  static EnvironmentBase get instance => _lazyInstance.value;

  AppParameters get params => _parameters;

  AppTheme get theme => _theme;

  KeyValueStore get mru => _mruStore;

  get appTitle => _appTile;

  bool inSession() => _session != null;

  ISession get session => _session;

  ESessionState get sessionState => _sessionState;

  Future<void> initialize() async {
    _funcGetInstance = () => this;

    _parameters = internalInitializeParameters();
    _theme = internalInitializeTheme();

    _internalInitializeSession(await KeyValueStore.initialize());
  }

  void logon(BuildContext context, ISession session) {
    if (inSession()) {
      return;
    }

    _internalLogoff();

    if (session == null) {
      return;
    }

    _session = session;
    _sessionState = ESessionState.Logged;

    _sessionStore.value = _session;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => createHomePage(),
      ),
    );
  }

  void logoff(BuildContext context) {
    if (!_internalLogoff()) {
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => createLoginPage(),
      ),
    );
  }

  bool _internalLogoff() {
    if (!inSession()) {
      return false;
    }

    _session = null;
    _sessionState = ESessionState.RequestAuthentication;

    return true;
  }

  void _internalInitializeSession(KeyValueStore store) {
    _mruStore = store;
    _sessionStore = store.getJsonProperty<ISession>(
        "evt:session",
        (ISession s) => sessionToJson(s),
        (String json) => sessionFromJson(json));

    final loadedSession = _sessionStore.value;

    if (loadedSession == null || loadedSession.expired) {
      _sessionState = ESessionState.RequestAuthentication;
    } else {
      _session = loadedSession;
      _sessionState = ESessionState.Logged;
    }
  }

  @protected
  AppParameters internalInitializeParameters();

  @protected
  AppTheme internalInitializeTheme();

  Widget getPageBy(ESessionState state) {
    switch (state) {
      case ESessionState.RequestAuthentication:
        return createLoginPage();
      case ESessionState.Logged:
        return createHomePage();
      default:
        return Container();
    }
  }

  @protected
  Widget createHomePage();

  @protected
  Widget createLoginPage();

  @protected
  String sessionToJson(ISession session);

  @protected
  ISession sessionFromJson(String json);
}
