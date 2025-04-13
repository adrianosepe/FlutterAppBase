part of fab_rx;

class UiDocField extends UiMaskField {
  UiDocField({
    Key? key,
    required property,
    required EDocType docType,
    String? hintText,
  }) : super(
          key: key,
          property: property,
          hintText: hintText,
          mask: getMaskAsStr(docType),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        );

  static String getMaskAsStr(EDocType docType) {
    switch (docType) {
      case EDocType.cpf:
        return '000.000.000-00';
      case EDocType.cnpj:
        return '00.000.000/0000-00';
      case EDocType.rg:
        return '000000000000000';
      case EDocType.inscricaoEstadual:
        return '000000000000000';
      case EDocType.cnh:
        return '000000000000000';
    }
  }

  static TextInputType? getKeyboardType(EDocType docType) {
    switch (docType) {
      case EDocType.cpf:
      case EDocType.cnpj:
      case EDocType.rg:
      case EDocType.inscricaoEstadual:
      case EDocType.cnh:
        return TextInputType.number;
    }
  }
}
