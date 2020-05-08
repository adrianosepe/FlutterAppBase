import 'package:app_base/ex_datetime.dart';

class ExJson {
		static String toMap(DateTime value) => value?.toIso8601String();

		static DateTime fromMap(dynamic value) => value == null ? null : ExDateTime.parse(value, utc: true);
}