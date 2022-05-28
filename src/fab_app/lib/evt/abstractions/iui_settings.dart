part of fab_app;

abstract class IUiSettings {
  ILayout get lay;
  IStyle get sty;
  IRender get render;

  TextStyle? get defaultInputTextStyle;
  InputDecoration get defaultInputDecoration;
}
