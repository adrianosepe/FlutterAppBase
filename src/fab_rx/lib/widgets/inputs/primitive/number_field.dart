part of fab_rx;

class UiNumberField extends UiPrimitiveField<String> {
  final String? hintText;
  final bool isCurrency;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller = TextEditingController();

  UiNumberField({
    required property,
    this.hintText,
    this.inputFormatters,
    this.isCurrency = false,
    Key? key,
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
      hintText: hintText,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: TextInputType.number,
      snapshot: snapshot,
    );

    // _controller.value = _controller.value.copyWith(text: snapshot.data);

    // return TextField(
    //   controller: _controller,
    //   onChanged: this.property.setter,
    //   textInputAction: TextInputAction.next,
    //   onSubmitted: (value) => FocusScope.of(context).nextFocus(),
    //   focusNode: HandleFocusNode.handle(isReadOnly: property.isReadOnly),
    //   inputFormatters: inputFormatters,
    //   obscureText: false,
    //   style: const TextStyle(fontSize: 20.0),
    //   keyboardType: TextInputType.number,
    //   textAlign: TextAlign.right,
    //   decoration: InputDecoration(
    //     errorText: snapshot.error?.toString(),
    //     labelText: hintText,
    //     contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(15.0),
    //     ),
    //   ),
    // );
  }
}
