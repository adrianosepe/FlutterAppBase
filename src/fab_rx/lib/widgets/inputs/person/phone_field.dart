part of fab_rx;

class UiPhoneField extends UiMaskField {
  final bool isCellphone;

  UiPhoneField({
    Key? key,
    required property,
    required this.isCellphone,
    String? hintText,
  }) : super(
          key: key,
          property: property,
          hintText: hintText,
          mask: isCellphone ? '(00) 00000-0000' : '(00) 0000-0000',
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        );
}
