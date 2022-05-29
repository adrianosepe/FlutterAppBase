part of fab_rx;

class UiNumberField extends UiPrimitiveField<String> {
  final TextEditingController controller = TextEditingController();

  final String? labelText;
  final String? hintText;
  final bool isCurrency;

  UiNumberField({
    Key? key,
    required property,
    this.labelText,
    this.hintText,
    this.isCurrency = false,
  }) : super(
          key: key,
          property: property,
        );

  @override
  Widget builder(BuildContext context, AsyncSnapshot<String?> snapshot) {
    controller.value = controller.value.copyWith(text: snapshot.data);

    return ui.render.renderInput(
      context: context,
      property: property,
      snapshot: snapshot,
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(),
      ],
      keyboardType: TextInputType.number,
      textAlign: TextAlign.right,
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    String newText = XNumber.formatDouble(value / 100, 2);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
