part of fab_app;

abstract class IRender {
  Widget renderInput({
    required BuildContext context,
    required IProperty<String> property,
    String? hintText,
    required TextEditingController controller,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    required AsyncSnapshot<String?> snapshot,
  });

  Widget renderSelector<T>({
    required BuildContext context,
    required IProperty<T> property,
    required IProperty<List<T>> datasource,
    String? hintText,
    required AsyncSnapshot snapshot,
  });

  Widget renderSwitch({
    required BuildContext context,
    required IProperty<bool> property,
    required String hintText,
    required AsyncSnapshot<bool?> snapshot,
  });

  Widget renderButton({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    required Color color,
  });

  Widget renderCard({
    required Widget child,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  });

  Widget renderContainer({
    required Widget child,
  });

  Widget renderGroupCard({
    required IconData iconData,
    double? iconSize,
    required String header,
    String? subHeader,
    required List<Widget> children,
  });
}
