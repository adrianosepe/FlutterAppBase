part of fab_lib;

class XFlow {
  static T? ifIs<T>(T? value, bool Function(T?) condition) {
    if (condition(value)) {
      return value;
    }

    return null;
  }

  static T? tryGet<T>(Func<T> get) {
    try {
      return get();
    } catch (ex) {
      return null;
    }
  }

  static void ensure(Act action) {
    try {
      action();
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  static Future<void> ensureAsync(Func<Future> action) async {
    try {
      await action();
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}
