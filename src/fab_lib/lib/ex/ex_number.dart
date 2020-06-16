part of fab_lib;

class ExNumber {
	static bool isGreatThan(String value, double reference) => parseDouble(value) > reference;

	static double parseDouble(String value) {
		if(value == null) {
			return null;
		}

		double d = double.tryParse(value.replaceAll(',', '.'));
		return d;
	}

	static String formatDouble(double value, int round) => value.toStringAsFixed(round);

	static double round(double value, int places){
		double mod = pow(10.0, places);
		return ((value * mod).round().toDouble() / mod);
	}
}
