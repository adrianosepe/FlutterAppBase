part of fab_app;

abstract class IHdi {
  Future<void> alert(String message);
  Future<void> errorOnResult(IResult result);
  Future<bool?> question(String question);
}
