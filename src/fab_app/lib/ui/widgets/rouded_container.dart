part of fab_app;

class UiRoudedContainer extends UiView {
  final Widget child;

  UiRoudedContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: this.child,
    );
  }
}
