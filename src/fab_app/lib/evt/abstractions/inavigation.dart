part of fab_app;

abstract class INavigation {
  BuildContext get context;

  void pop<T>([T? result]);

  Future<T?> push<T>(WidgetBuilder builder, {bool popBefore = false});

  Future<T?> replace<T>(WidgetBuilder builder);

  Future<T?> pushAndRemoveUntilHome<T, THome extends Widget>(WidgetBuilder builder);
}
