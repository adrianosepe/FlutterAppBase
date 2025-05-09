part of fab_app;

class BaseHdi extends BaseContext implements IHdi {
  ProgressDialog? _pd;

  @override
  Future<void> alert(String alert) => MessageDialog.alert(context, alert);

  @override
  Future<bool> question(String question) => MessageDialog.question(context, question);

  @override
  Future<void> information(String question) => MessageDialog.information(context, question);

  @override
  Future<void> toastInformation(String information) async {
    return MotionToast.success(
      description: Text(
        information,
        style: TextStyle(fontSize: 12),
      ),
      layoutOrientation: ToastOrientation.rtl,
      animationType: AnimationType.fromRight,
      dismissable: true,
    ).show(context);
  }

  @override
  Future<void> notifyFeatureInDevelop() {
    return toastInformation('Em desenvolvimento! ;)');
  }

  @override
  Future<bool> handlingOnError(IResult result) async {
    if (result.ok) {
      return false;
    }

    MotionToast.error(
      description: Text(
        result.message ?? XString.empty,
        style: TextStyle(fontSize: 12),
      ),
      layoutOrientation: ToastOrientation.rtl,
      animationType: AnimationType.fromRight,
      dismissable: true,
    ).show(context);

    return true;
  }

  @override
  void unfocus() {
    FocusScope.of(context).unfocus();
  }

  @override
  Future<DateTime?> selectDate({
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    DateTime? currentDate,
  }) {
    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      currentDate: currentDate,
    );
  }

  @override
  Future<ETakePicture> selectPictureSource() async {
    final selection = await SelectionDialog.selectUsing(
      context,
      [
        IconOption(ETakePicture.gallery, Icons.photo_library, 'Galeria de Fotos'),
        IconOption(ETakePicture.camera, Icons.photo_camera, 'Câmera'),
        IconOption(ETakePicture.none, Icons.close, 'Cancelar'),
      ],
    );

    return selection ?? ETakePicture.none;
  }

  @override
  Future<TResult?> modal<TResult>(WidgetBuilder builder) {
    return showDialog<TResult?>(
      context: context,
      builder: builder,
    );
  }

  @override
  Future<void> showProgress({String? message}) {
    _pd = ProgressDialog(context: context);
    _pd!.show(
      max: 50,
      msg: message ?? XString.empty,
      barrierColor: const Color(0x55212121),
    );

    return Future.value();
  }

  @override
  Future<void> hideProgress() {
    _pd?.close();
    _pd = null;

    return Future.value();
  }
}
