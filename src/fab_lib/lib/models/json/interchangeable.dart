part of fab_lib;

abstract class Interchangeable {
  String toJson();
  Map<String, dynamic> toMap();
  Interchangeable? fromJson(Map<String, dynamic>? map);
}
