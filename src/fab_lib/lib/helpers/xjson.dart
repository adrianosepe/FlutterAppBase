part of fab_lib;

class XJson {
  static String? toMap(DateTime? value) => value?.toIso8601String();
  static DateTime? fromMap(dynamic value) => value == null ? null : XDateTime.parse(value, utc: true);
}
