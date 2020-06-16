part of fab_app;

abstract class ISession {
  bool get expired;
  String get name;
  String get email;
}