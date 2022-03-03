part of fab_app;

abstract class IHdi {
  Future<void> alert(String message);
  Future<bool> question(String question);
  Future<void> information(String information);
  Future<void> toastInformation(String information);

  Future<void> errorOnResult(IResult result);
}
