part of fab_lib;

class XString {
  static String empty = '';

  static bool isNullOrEmpty(String? value) => value == null || value.length == 0;

  static String ifIsNullOrEmpty(String? value, String newValue) => isNullOrEmpty(value) ? newValue : value!;
}
