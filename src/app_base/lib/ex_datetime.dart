import 'package:app_base/models/date_range.dart';
import 'package:intl/intl.dart';

class ExDateTime {
	static final DateFormat defFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
	static final DateFormat defFormatWithoutSeconds = DateFormat('dd/MM/yyyy HH:mm');

	static String format(DateTime value) => defFormat.format(value);
	static String formatWithoutSeconds(DateTime value) => defFormatWithoutSeconds.format(value);

  static DateTime parse(String value, {bool utc = false}) {
  	try {
  		final dt = DateTime.parse(value);

  		return utc ? dt.toUtc() : dt.toLocal();
	  } catch (Exception) {
  		return defFormat.parse(value, utc);
	  }
  }

  static DateTime now() => DateTime.now();
  static DateTime today() => date(now());

	static DateTime tomorrow() {
		final n = now();

		return date(n).add(Duration(days: 1));
	}

	static DateTime yesterday() {
		final n = now();

		return date(n).add(Duration(days: -1));
	}

  static DateTime date(DateTime n) => DateTime(n.year, n.month, n.day);

  static DateTime getDate(int timestamp) => DateTime.fromMicrosecondsSinceEpoch(timestamp, isUtc: true);

  static DateRange adjustTime(DateRange range) {
	  final begin = ExDateTime.date(range.begin);
	  var end = ExDateTime.date(range.end).add(Duration(seconds: (24 * 3600) - 1));

	  return DateRange(begin, end);
  }
}