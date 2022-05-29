part of fab_rx;

class UiBoolField extends UiPrimitiveField<bool> {
  final String? labelText;
  final EBoolStyle style;
  final TextStyle? checkedTextStyle;
  final TextStyle? uncheckedTextStyle;

  const UiBoolField({
    Key? key,
    required property,
    this.style = EBoolStyle.Switch,
    this.labelText,
    this.checkedTextStyle,
    this.uncheckedTextStyle,
  }) : super(
          key: key,
          property: property,
        );

  @override
  Widget builder(BuildContext context, AsyncSnapshot<bool?> snapshot) {
    switch (style) {
      case EBoolStyle.Switch:
        return ui.render.renderSwitch(
          context: context,
          property: property,
          labelText: labelText,
          snapshot: snapshot,
        );
      case EBoolStyle.Checkbox:
        return ui.render.renderCheckbox(
          context: context,
          property: property,
          labelText: labelText,
          snapshot: snapshot,
          checkedTextStyle: checkedTextStyle,
          uncheckedTextStyle: uncheckedTextStyle,
        );
    }
  }
}

enum EBoolStyle {
  Switch,
  Checkbox,
}
