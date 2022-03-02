part of fab_app;

abstract class BaseNavigation implements INavigation {
  BuildContext get context => BaseContext.currentContext;

  void pop<T>([T? result]) {
    Navigator.pop<T>(context, result);
  }

  Future<T?> push<T>(WidgetBuilder builder, {bool popBefore = false}) {
    if (popBefore) {
      pop(context);
    }

    return Navigator.push(context, MaterialPageRoute(builder: builder));
  }

  Future<T?> replace<T>(WidgetBuilder builder) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: builder),
    );
  }

  Future<T?> pushAndRemoveUntilHome<T, THome extends Widget>(WidgetBuilder builder) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: builder),
      (Route<dynamic> route) => false,
      // ModalRoute.withName('/'),
    );
  }
}
