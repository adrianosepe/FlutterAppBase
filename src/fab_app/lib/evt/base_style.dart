part of fab_app;

abstract class BaseStyle implements IStyle {
  BuildContext get context => BaseContext.currentContext;
  ThemeData get t => Theme.of(context);

  Color get primaryColor => t.colorScheme.primary;
  Color get primaryColor2 => t.colorScheme.primary.withAlpha(70);
  Color get secondaryColor => t.colorScheme.secondary;

  TextTheme get ofText => t.textTheme;

  Color getColorByAction(EAppAction appAction) {
    switch (appAction) {
      case EAppAction.Primary:
        return t.primaryColor;
      case EAppAction.Success:
        return Color(0xff5cb85c);
      case EAppAction.Info:
        return Color(0xff5bc0de);
      case EAppAction.Warning:
        return Color(0xfff0ad4e);
      case EAppAction.Danger:
        return Color(0xffd9534f);
      case EAppAction.Inverse:
        return Color(0xff292b2c);
      default:
        return Color(0xfff7f7f7);
    }
  }
}
