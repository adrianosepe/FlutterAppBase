part of fab_app;

abstract class IStyle {
  Color get primaryColor;
  Color get secondaryColor;

  TextTheme get ofText;

  Color getColorByAction(EAppAction appAction);
}
