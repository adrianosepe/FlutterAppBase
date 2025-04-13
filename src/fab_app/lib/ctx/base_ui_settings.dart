part of fab_app;

abstract class BaseUiSettings<TLayout extends ILayout, TStyle extends IStyle, TRender extends IRender>
    implements IUiSettings {
  late TLayout _lay;
  late TStyle _sty;
  late TRender _render;

  @override
  TLayout get lay => _lay;
  @override
  TStyle get sty => _sty;
  @override
  TRender get render => _render;

  final double defaultCircularBorderRadius = 5;

  Future<void> init() async {
    _lay = await internalCreateLayout();
    _sty = await internalCreateStyle();
    _render = await internalCreateRender();
  }

  @override
  TextStyle? get defaultInputTextStyle => const TextStyle(fontSize: 20);

  @override
  InputDecoration get defaultInputDecoration => InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultCircularBorderRadius),
        ),
      );

  Future<TLayout> internalCreateLayout();

  Future<TStyle> internalCreateStyle();

  Future<TRender> internalCreateRender();
}
