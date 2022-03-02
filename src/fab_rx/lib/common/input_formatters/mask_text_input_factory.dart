part of fab_rx;

class MaskTextInputFactory {
  static final regJustNumbers = RegExp(r'[0-9]');
  static final regJustLetters = RegExp(r'[a-zA-Z]');
  static final regLettersAndNumbers = RegExp(r'[0-9a-zA-Z]');

  static TextInputFormatter create(EBusinessData businessData) {
    switch (businessData) {
      case EBusinessData.Cpf:
        return MaskTextInputFormatter(mask: '###.###.###-##', filter: {"#": regJustNumbers});
      case EBusinessData.Cnpj:
        return MaskTextInputFormatter(mask: '##.###.###/####-##', filter: {"#": regJustNumbers});
      case EBusinessData.Rg:
        return MaskTextInputFormatter(mask: '##################', filter: {"#": regJustNumbers});
      case EBusinessData.Cnh:
        return MaskTextInputFormatter(mask: '##################', filter: {"#": regJustNumbers});
      case EBusinessData.Plate:
        return MaskTextInputFormatter(
          mask: 'AAA0@00',
          filter: {
            "A": regJustLetters,
            '@': regLettersAndNumbers,
            '0': regJustNumbers,
          },
        );
      case EBusinessData.Date:
        return MaskTextInputFormatter(mask: '##/##/####', filter: {"#": regJustNumbers});
      case EBusinessData.Zipcode:
        return MaskTextInputFormatter(mask: '#####-###', filter: {"#": regJustNumbers});
      default:
        throw Exception('Invalid EBusinessData for creation correctly TextInputFormatter');
    }
  }

  static TextInputFormatter createForDocType(EDocType docType) => create(EBusinessData.values.firstWhere((e) => e.name == docType.name));

  static TextInputFormatter createCustom(String mask) {
    return MaskTextInputFormatter(mask: mask, filter: {
      "A": regJustLetters,
      '@': regLettersAndNumbers,
      '0': regJustNumbers,
    });
  }
}
