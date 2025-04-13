part of fab_app;

abstract class BaseStyle implements IStyle {
  BuildContext get context => BaseContext.currentContext;
  ThemeData get t => Theme.of(context);

  @override
  Color get primaryColor => t.colorScheme.primary;
  @override
  Color get secondaryColor => t.colorScheme.secondary;
  @override
  Color get background => t.colorScheme.surface;

  @override
  ColorScheme get ofColor => t.colorScheme;
  @override
  TextTheme get ofText => t.textTheme;

  @override
  Color getColorByAction(EAppAction appAction) {
    switch (appAction) {
      case EAppAction.primary:
        return t.primaryColor;
      case EAppAction.success:
        return const Color(0xff5cb85c);
      case EAppAction.info:
        return const Color(0xff5bc0de);
      case EAppAction.warning:
        return const Color(0xfff0ad4e);
      case EAppAction.danger:
        return const Color(0xffd9534f);
      case EAppAction.inverse:
        return const Color(0xff292b2c);
      default:
        return const Color(0xfff7f7f7);
    }
  }
}
