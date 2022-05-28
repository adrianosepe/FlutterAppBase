part of fab_rx;

class UiContainer extends UiView {
  final Widget child;

  const UiContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ui.render.renderContainer(
      child: child,
    );
  }
}
