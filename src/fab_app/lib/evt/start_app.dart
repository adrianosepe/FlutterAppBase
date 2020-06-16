part of fab_app;

class StartApp {
  EnvironmentBase _evt;
  SentryClient _sentry;

  void start(EnvironmentBase evt) async {
    _evt = evt;

    await _evt.initialize();

    final params = _evt.params;

    _sentry = SentryClient(dsn: params.sentryUrl);

    FlutterError.onError = (FlutterErrorDetails details) {
      if (evt.params.inDebug) {
        // In development mode, simply print to console.
        FlutterError.dumpErrorToConsole(details);
      } else {
        // In production mode, report to the application zone to report to
        // Sentry.
        FlutterError.dumpErrorToConsole(details);
        Zone.current.handleUncaughtError(details.exception, details.stack);
      }
    };

    runZoned<Future<void>>(() async {
      runApp(ExApp(_evt));
      // ignore: deprecated_member_use
    }, onError: (error, stackTrace) {
      // Whenever an error occurs, call the `_reportError` function. This sends
      // Dart errors to the dev console or Sentry depending on the environment.
      _reportError(error, stackTrace);
    });

    runApp(ExApp(_evt));
  }

  Future<void> _reportError(dynamic error, dynamic stackTrace) async {
    // Print the exception to the console.
    print('Caught error: $error');

    if (_evt.params.inDebug) {
      // Print the full stacktrace in debug mode.
      print(stackTrace);

      return;
    } else {
      // Send the Exception and Stacktrace to Sentry in Production mode.
      _sentry.captureException(
        exception: error,
        stackTrace: stackTrace,
      );
    }
  }
}

class ExApp extends StatefulWidget {
  final EnvironmentBase evt;

  ExApp(this.evt);

  @override
  _ExAppState createState() => _ExAppState();
}

class _ExAppState extends State<ExApp> {
  ESessionState _sessionState;

  @override
  void initState() {
    super.initState();

    final evt = EnvironmentBase.instance;

    _sessionState = evt.sessionState;
  }

  @override
  Widget build(BuildContext context) {
    final evt = widget.evt;
    final theme = evt.theme;

    final iconTheme = IconThemeData(color: theme.iconColor);

    var app = new MaterialApp(
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale.fromSubtags(languageCode: 'pt', countryCode: "BR"),
        ],
        title: widget.evt.appTitle,
        theme: ThemeData(
          primaryColor: theme.primaryColor,
          accentColor: theme.accentColor,
          brightness: theme.brightness,
          backgroundColor: theme.backgroundColor,
          scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
          iconTheme: iconTheme,
        ),
        home: evt.getPageBy(_sessionState),
        debugShowCheckedModeBanner: true);

    return app;
  }
}