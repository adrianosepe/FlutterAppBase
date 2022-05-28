part of fab_app;

class UiButton extends UiView {
  final String text;
  final VoidCallback onPressed;
  final EAppAction action;

  UiButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.action = EAppAction.Primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = ui.sty.getColorByAction(action);

    return ui.render.renderButton(
      context: context,
      text: text,
      onPressed: onPressed,
      color: color,
    );
  }
}
