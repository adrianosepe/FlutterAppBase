part of fab_rx;

class UiGroupCard extends UiView {
  final IconData iconData;
  final double? iconSize;
  final String header;
  final String? subHeader;
  final List<Widget> children;

  UiGroupCard({
    Key? key,
    required this.iconData,
    required this.header,
    this.subHeader,
    required this.children,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ui.render.renderGroupCard(
      iconData: iconData,
      iconSize: iconSize,
      header: header,
      subHeader: subHeader,
      children: children,
    );
  }
}
