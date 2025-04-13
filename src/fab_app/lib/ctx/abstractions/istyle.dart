part of fab_app;

abstract class IStyle {
  Color get primaryColor;
  Color get secondaryColor;
  Color get background;

  TextTheme get ofText;
  ColorScheme get ofColor;

  Color getColorByAction(EAppAction appAction);
}
