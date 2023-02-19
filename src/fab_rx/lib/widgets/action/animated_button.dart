part of fab_rx;

class UiAnimatedButton extends UiView {
  final String text;
  final ActionControllerCallback? onPressed;

  final Color? color;

  const UiAnimatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ui.render.renderAnimatedButton(
      context: context,
      text: text,
      onPressed: onPressed,
      color: color,
    );
  }
}
