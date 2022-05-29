part of fab_lib;

class XNumber {
  static final currencyFormatter = NumberFormat.simpleCurrency();

  static String formatDouble(double value, int round) => value.toStringAsFixed(round).replaceAll('.', ',');
  static String formatAsCurrency(double value) => currencyFormatter.format(value);

  static bool isGreatThan(String value, double reference) => parseDouble(value)! > reference;

  static double? parseDouble(String? value) {
    if (value == null) {
      return null;
    }

    return double.tryParse(value.replaceAll('.', '').replaceAll(',', '.'));
  }

  static double round(double value, int places) {
    num mod = pow(10.0, places);

    return ((value * mod).round().toDouble() / mod);
  }
}
