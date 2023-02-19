part of fab_rx;

class UiCard extends UiView {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  UiCard({
    Key? key,
    required this.child,
    this.color,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ui.render.renderCard(
      color: color,
      margin: margin,
      padding: padding,
      child: child,
    );
  }
}
