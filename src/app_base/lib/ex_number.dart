class ExNumber {
	static bool isGreatThan(String value, double reference) => parseDouble(value) > reference;

	static double parseDouble(String value) {
		if(value == null) {
			return null;
		}

		double d = double.tryParse(value.replaceAll(',', '.'));
		return d;
	}

	static String formatDouble(double value, int round) {
		return value.toStringAsFixed(round);
	}
}
