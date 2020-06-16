part of fab_lib;

class ExJson {
		static String toMap(DateTime value) => value?.toIso8601String();

		static DateTime fromMap(dynamic value) => value == null ? null : ExDateTime.parse(value, utc: true);
}