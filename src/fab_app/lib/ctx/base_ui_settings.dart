part of fab_app;

abstract class BaseUiSettings<TLayout extends ILayout, TStyle extends IStyle, TRender extends IRender> implements IUiSettings {
  late TLayout _lay;
  late TStyle _sty;
  late TRender _render;

  TLayout get lay => _lay;
  TStyle get sty => _sty;
  TRender get render => _render;

  final double defaultCircularBorderRadius = 5;

  Future<void> init() async {
    _lay = await internalCreateLayout();
    _sty = await internalCreateStyle();
    _render = await internalCreateRender();
  }

  TextStyle? get defaultInputTextStyle => TextStyle(fontSize: 20);

  InputDecoration get defaultInputDecoration => InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultCircularBorderRadius),
        ),
      );

  @protected
  Future<TLayout> internalCreateLayout();

  @protected
  Future<TStyle> internalCreateStyle();

  @protected
  Future<TRender> internalCreateRender();
}
