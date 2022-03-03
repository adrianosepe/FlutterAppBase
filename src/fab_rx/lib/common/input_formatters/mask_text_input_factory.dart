part of fab_rx;

class MaskTextInputFactory {
  static final regJustNumbers = RegExp(r'[0-9]');
  static final regJustLetters = RegExp(r'[a-zA-Z]');
  static final regLettersAndNumbers = RegExp(r'[0-9a-zA-Z]');

  static List<TextInputFormatter> create(EBusinessData businessData) {
    switch (businessData) {
      case EBusinessData.Cpf:
        return [CpfInputFormatter(), FilteringTextInputFormatter.digitsOnly];
      case EBusinessData.Cnpj:
        return [CnpjInputFormatter(), FilteringTextInputFormatter.digitsOnly];
      case EBusinessData.CpfOrCnpj:
        return [CpfOuCnpjFormatter(), FilteringTextInputFormatter.digitsOnly];
      case EBusinessData.Rg:
        return [FilteringTextInputFormatter.digitsOnly];
      case EBusinessData.InscricaoEstadual:
        return [FilteringTextInputFormatter.digitsOnly];
      case EBusinessData.Cnh:
        return [FilteringTextInputFormatter.digitsOnly];
      case EBusinessData.Phone:
      case EBusinessData.CellPhone:
        return [TelefoneInputFormatter(), FilteringTextInputFormatter.digitsOnly];
      case EBusinessData.Plate:
        return [PlacaVeiculoInputFormatter()];
      case EBusinessData.Date:
        return [DataInputFormatter(), FilteringTextInputFormatter.digitsOnly];
      case EBusinessData.Zipcode:
        return [CepInputFormatter(), FilteringTextInputFormatter.digitsOnly];

      default:
        throw Exception('Invalid EBusinessData for creation correctly TextInputFormatter');
    }
  }

  static List<TextInputFormatter> createForDocType(EDocType docType) => create(EBusinessData.values.firstWhere((e) => e.name == docType.name));

  static List<TextInputFormatter> createCustom(String mask) {
    return [
      MaskTextInputFormatter(mask: mask, filter: {
        "A": regJustLetters,
        '@': regLettersAndNumbers,
        '0': regJustNumbers,
      }),
    ];
  }
}
