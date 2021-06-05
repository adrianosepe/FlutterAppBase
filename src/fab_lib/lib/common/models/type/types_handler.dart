import 'package:app_base/ex_datetime.dart';
import 'package:app_base/ex_string.dart';

class TypesHandler {
  static String dateFromApi(String value) {
    if (ExString.isNullOrEmpty(value)) {
      return null;
    }

    try {
      return ExDateTime.formatDate(ExDateTime.parse(value));
    } catch (Exception) {
      return null;
    }
  }
}
