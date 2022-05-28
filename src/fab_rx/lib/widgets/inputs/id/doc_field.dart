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
      case EDocType.Cpf:
        return '000.000.000-00';
      case EDocType.Cnpj:
        return '00.000.000/0000-00';
      case EDocType.Rg:
        return '000000000000000';
      case EDocType.InscricaoEstadual:
        return '000000000000000';
      case EDocType.Cnh:
        return '000000000000000';
    }
  }

  static TextInputType? getKeyboardType(EDocType docType) {
    switch (docType) {
      case EDocType.Cpf:
      case EDocType.Cnpj:
      case EDocType.Rg:
      case EDocType.InscricaoEstadual:
      case EDocType.Cnh:
        return TextInputType.number;
    }
  }
}
