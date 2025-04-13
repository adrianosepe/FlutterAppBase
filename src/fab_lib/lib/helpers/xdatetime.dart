part of fab_lib;

class XDateTime {
  static final intl.DateFormat defFileNameFormat = intl.DateFormat('ddMMyyHHmm');
  static final intl.DateFormat defFileNameWithSecondsFormat = intl.DateFormat('ddMMyyHHmmss');
  static final intl.DateFormat defFormatSmallWithoutSeconds = intl.DateFormat('dd/MM/yy HH:mm');
  static final intl.DateFormat defFormatSmallWithoutSecondsTwoLines = intl.DateFormat('dd/MM/yy\nHH:mm');
  static final intl.DateFormat defFormatWithoutSeconds = intl.DateFormat('dd/MM/yyyy HH:mm');
  static final intl.DateFormat defFormat = intl.DateFormat('dd/MM/yyyy HH:mm:ss');
  static final intl.DateFormat defFormatAsDate = intl.DateFormat('dd/MM/yyyy');
  static final intl.DateFormat defFormatAsDateTimePhp = intl.DateFormat('yyyy-MM-dd HH:mm:ss');
  static final intl.DateFormat defFormatAsDatePhp = intl.DateFormat('yyyy-MM-dd');

  static String format(DateTime value) => defFormatAsDate.format(value);
  static String formatPhp(DateTime value) => defFormatAsDateTimePhp.format(value);
  static String formatFileName(DateTime value) => defFileNameFormat.format(value);
  static String formatFileNameWithSeconds(DateTime value) => defFileNameWithSecondsFormat.format(value);
  static String formatAsDate(DateTime value) => defFormatAsDate.format(value);
  static String formatSmallWithoutSeconds(DateTime value) => defFormatSmallWithoutSeconds.format(value);
  static String formatSmallWithoutSecondsTwoLines(DateTime value) => defFormatSmallWithoutSecondsTwoLines.format(value);
  static String formatWithoutSeconds(DateTime value) => defFormatWithoutSeconds.format(value);

  static DateTime? parse(String value, {bool utc = false}) {
    try {
      if (XString.isNullOrEmpty(value)) {
        return null;
      }

      final dt = DateTime.parse(value);

      return utc ? dt.toUtc() : dt.toLocal();
    } catch (ex) {
      try {
        return defFormat.parse(value, utc);
      } catch (ex) {
        return defFormatAsDate.parse(value, utc);
      }
    }
  }

  static DateTime? parseOld(String value, {bool utc = false}) {
    try {
      if (XString.isNullOrEmpty(value)) {
        return null;
      }

      final dt = DateTime.parse(value);

      return utc ? dt.toUtc() : dt.toLocal();
    } catch (ex) {
      try {
        return defFormat.parse(value, utc);
      } catch (ex) {
        return defFormatAsDate.parse(value, utc);
      }
    }
  }

  static DateTime? parseAsPhp(String value, {bool utc = false}) {
    try {
      if (XString.isNullOrEmpty(value)) {
        return null;
      }

      final dt = defFormatAsDatePhp.parse(value, utc);

      return dt;
    } catch (ex) {
      return null;
    }
  }

  static DateTime now() => DateTime.now();
  static DateTime today() => date(now());

  static DateTime tomorrow() {
    final n = now();

    return date(n).add(const Duration(days: 1));
  }

  static DateTime yesterday() {
    final n = now();

    return date(n).add(const Duration(days: -1));
  }

  static DateTime fillTime(DateTime n) => DateTime(n.year, n.month, n.day, 23, 59, 59);

  static DateTime date(DateTime n) => DateTime(n.year, n.month, n.day);

  static DateTime getDate(int timestamp, {bool isUtc = false}) => DateTime.fromMicrosecondsSinceEpoch(timestamp, isUtc: isUtc);

  static DateRange adjustTime(DateRange range) {
    final begin = XDateTime.date(range.begin!);
    var end = XDateTime.date(range.end!).add(const Duration(seconds: (24 * 3600) - 1));

    return DateRange(
      begin: begin,
      end: end,
    );
  }

  static bool isValid(String value, EDateTimeFormat format) {
    try {
      format == EDateTimeFormat.date ? defFormatAsDate.parse(value) : defFormat.parse(value);

      return true;
    } catch (ex) {
      return false;
    }
  }
}

enum EDateTimeFormat {
  date,
  dateTime,
}
