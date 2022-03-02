part of fab_lib;

class XNumber {
  static bool isGreatThan(String value, double reference) => parseDouble(value)! > reference;

  static double? parseDouble(String? value) {
    if (value == null) {
      return null;
    }

    return double.tryParse(value.replaceAll(',', '.'));
  }

  static String formatDouble(double value, int round) => value.toStringAsFixed(round);

  static double round(double value, int places) {
    num mod = pow(10.0, places);

    return ((value * mod).round().toDouble() / mod);
  }
}
