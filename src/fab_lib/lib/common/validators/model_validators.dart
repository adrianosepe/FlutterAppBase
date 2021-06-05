import 'package:app_base/events/delegates.dart';
import 'package:app_base/ex_datetime.dart';
import 'package:app_base/ex_string.dart';
import 'package:vmais/common/rx/app_property.dart';
import 'package:vmais/common/validators/docs/cnpj.dart';
import 'package:vmais/common/validators/docs/cpf.dart';
import 'package:vmais/common/validators/validation_result.dart';
import 'package:vmais/models/utils/data_normalizer.dart';

class ModelValidators {
  static String _emailPattern = "^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String _mercosulPlacaPattern = "[a-zA-Z]{3}-?[0-9][a-zA-Z0-9][0-9]{2}";

  static ValidationResult begin({ValidationResult validations}) => validations ?? ValidationResult();

  static String isEmail(String email) => _check(_emailPattern, email, 'E-mail não é válido');

  static String isCpf(String value) {
    if (ExString.isNullOrEmpty(value)) {
      return null;
    }

    if (!Cpf.isValid(value)) {
      return 'CPF não é válido';
    }

    return null;
  }

  static String isCnpj(String value) {
    if (ExString.isNullOrEmpty(value)) {
      return null;
    }

    if (!Cnpj.isValid(value)) {
      return 'CNPJ não é válido';
    }

    return null;
  }

  static String isRg(String value) {
    if (ExString.isNullOrEmpty(value)) {
      return null;
    }

    return value.length <= 5 ? 'RG inválido' : null;
  }

  static String isCep(String value) {
    if (ExString.isNullOrEmpty(value)) {
      return null;
    }

    final v = DataNormalizer.removePunctuation(value);

    return v.length != 8 ? 'CEP inválido' : null;
  }

  static String isCpfOrCnpj(String value) {
    if (ExString.isNullOrEmpty(value)) {
      return null;
    }

    final v = DataNormalizer.removePunctuation(value);

    return v.length == 14 ? isCnpj(value) : isCpf(value);
  }

  static String isMercosulPlaca(String placa) => _check(_mercosulPlacaPattern, placa, 'Placa não é válida');

  static String isDate(String value) {
    if (ExString.isNullOrEmpty(value)) {
      return null;
    }
    return ExDateTime.isValid(value, EDateTimeFormat.Date) ? null : 'Data inválida';
  }

  static String isLocationValid(LocationData location, ELocationRestrict restrict) {
    if (restrict == ELocationRestrict.State && (location == null || location.state == null)) {
      return 'Selecione o estado';
    }

    if (restrict == ELocationRestrict.StateAndCity && (location == null || location.state == null)) {
      return 'Selecione o estado/cidade';
    }

    return location.city == null ? 'Selecione a cidade' : null;
  }

  static bool check<T>(
    Property<T> property,
    Func1<T, String> what, {
    ValidationResult validationResult,
  }) {
    String failMessage;

    if (what != null) {
      failMessage = what.call(property.value);
    }

    if (ExString.isNullOrEmpty(failMessage) && property.isRequired && property.value == null) {
      failMessage = 'Esse campo é requerido';
    }

    if (ExString.isNullOrEmpty(failMessage)) {
      return true;
    }

    validationResult?.add(failMessage);
    property.subject.addError(failMessage);

    return false;
  }

  static String _check(String pattern, String value, String invalidMessage) {
    if (!_match(pattern, value ?? '')) {
      return invalidMessage;
    }

    return null;
  }

  static bool _match(String pattern, String value) => RegExp(pattern).hasMatch(value);
}

enum ELocationRestrict { State, StateAndCity }
