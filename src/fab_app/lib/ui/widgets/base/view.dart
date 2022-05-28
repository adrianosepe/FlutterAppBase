part of fab_app;

abstract class UiView extends StatelessWidget {
  IEnvironment get evt => BaseContext.currentEvt;

  INavigation get nav => evt.nav;
  IUiSettings get ui => evt.ui;
  IHdi get hdi => evt.hdi;

  const UiView({Key? key}) : super(key: key);
}
