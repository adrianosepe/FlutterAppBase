part of fab_app;

abstract class IHdi {
  void unfocus();

  Future<void> alert(String message);
  Future<bool> question(String question);
  Future<void> information(String information);
  Future<void> toastInformation(String information);

  Future<void> notifyFeatureInDevelop();

  Future<void> showProgress({String? message});
  Future<void> hideProgress();

  Future<bool> handlingOnError(IResult result);

  Future<DateTime?> selectDate({required DateTime initialDate, required DateTime firstDate, required DateTime lastDate, DateTime? currentDate});
  Future<ETakePicture> selectPictureSource();

  Future<TResult?> modal<TResult>(WidgetBuilder builder);
}
