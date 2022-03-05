part of fab_rx;

class UiPhoneField extends UiMaskField {
  final bool isCellphone;

  UiPhoneField({
    Key? key,
    required property,
    required hintText,
    required this.isCellphone,
  }) : super(
          key: key,
          property: property,
          hintText: hintText,
          mask: isCellphone ? '(00) 00000-0000' : '(00) 00000-0000',
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        );
}
