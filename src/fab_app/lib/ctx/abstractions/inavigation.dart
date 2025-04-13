part of fab_app;

abstract class INavigation {
  BuildContext get context;

  void pop<T>([T? result]);

  Future<T?> push<T>(WidgetBuilder builder, {bool popBefore = false});
  Future<T?> pushWithName<T>(WidgetBuilder builder, String name, {bool popBefore = false});
  Future<T?> pushAndRemoveWithName<T, THome extends Widget>(WidgetBuilder builder, String name);
  Future<T?> pushAndRemoveUntilHome<T, THome extends Widget>(WidgetBuilder builder);

  Future<T?> replace<T>(WidgetBuilder builder);
}
