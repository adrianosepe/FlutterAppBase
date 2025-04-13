part of fab_app;

abstract class BaseNavigation implements INavigation {
  @override
  BuildContext get context => BaseContext.currentContext;

  @override
  void pop<T>([T? result]) {
    Navigator.pop<T>(context, result);
  }

  @override
  Future<T?> push<T>(WidgetBuilder builder, {bool popBefore = false}) {
    if (popBefore) {
      pop(context);
    }

    return Navigator.push(context, MaterialPageRoute(builder: builder));
  }

  @override
  Future<T?> pushWithName<T>(WidgetBuilder builder, String name, {bool popBefore = false}) {
    if (popBefore) {
      pop(context);
    }

    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: builder,
        settings: RouteSettings(name: name),
      ),
    );
  }

  @override
  Future<T?> replace<T>(WidgetBuilder builder) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: builder),
    );
  }

  @override
  Future<T?> pushAndRemoveUntilHome<T, THome extends Widget>(WidgetBuilder builder) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: builder),
      (Route<dynamic> route) => false,
      // ModalRoute.withName('/'),
    );
  }

  @override
  Future<T?> pushAndRemoveWithName<T, THome extends Widget>(WidgetBuilder builder, String name) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: builder,
        settings: RouteSettings(name: name),
      ),
      (Route<dynamic> route) => route.settings.name != name,
    );
  }
}
