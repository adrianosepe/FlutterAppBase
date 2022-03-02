part of fab_rx;

class UiContainer extends UiView {
  final Widget child;

  const UiContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ui.render.renderContainer(
      child: child,
    );
  }
}
