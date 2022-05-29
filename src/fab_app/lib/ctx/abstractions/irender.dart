part of fab_app;

abstract class IRender {
  Widget renderInput({
    required BuildContext context,
    required IProperty<String> property,
    String? labelText,
    String? hintText,
    required TextEditingController controller,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
    required AsyncSnapshot<String?> snapshot,
    bool obscureText = false,
    String obscuringCharacter = '*',
    TextAlign textAlign = TextAlign.left,
  });

  Widget renderDropdown<T>({
    required BuildContext context,
    required IProperty<T> property,
    required IProperty<List<T>> datasource,
    String? labelText,
    required AsyncSnapshot snapshot,
  });

  Widget renderSelector<T>({
    required BuildContext context,
    required IProperty<T> property,
    required IProperty<List<T>> datasource,
    String? labelText,
    String? hintText,
    bool isSearchable,
    required AsyncSnapshot snapshot,
  });

  Widget renderSwitch({
    required BuildContext context,
    required IProperty<bool> property,
    required String? labelText,
    required AsyncSnapshot<bool?> snapshot,
  });

  Widget renderCheckbox({
    required BuildContext context,
    required IProperty<bool> property,
    required String? labelText,
    required AsyncSnapshot<bool?> snapshot,
    TextStyle? checkedTextStyle,
    TextStyle? uncheckedTextStyle,
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
