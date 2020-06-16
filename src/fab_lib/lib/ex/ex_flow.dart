part of fab_lib;

class ExFlow {
	static T ifIs<T>(T value, bool Function(T) condition) {
		if (condition(value)) {
			return value;
		}

		return null;
	}

	static T tryGet<T>(Func<T> get) {
		try {
			return get();
		} catch (Exception) {
			return null;
		}
	}

	static void ensure(Act action) {
		try {
			action();
		} catch(ex) {
			print(ex.toString());
		}
	}
}