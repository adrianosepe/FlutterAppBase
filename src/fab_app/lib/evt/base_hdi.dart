part of fab_app;

class BaseHdi implements IHdi {
  BuildContext get context => BaseContext.currentContext;

  @override
  Future<void> alert(String alert) => MessageDialog.alert(context, alert);

  @override
  Future<bool> question(String question) => MessageDialog.question(context, question);

  @override
  Future<void> information(String question) => MessageDialog.information(context, question);

  @override
  Future<void> toastInformation(String information) async {
    await ft.Fluttertoast.showToast(
      msg: information,
      toastLength: ft.Toast.LENGTH_SHORT,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
    );
  }

  Future<TResult?> modal<TResult>(WidgetBuilder builder) {
    return showDialog<TResult?>(
      context: context,
      builder: builder,
    );
  }

  Future<void> errorOnResult(IResult result) async {
    if (result.ok) {
      return;
    }

    await ft.Fluttertoast.showToast(
      msg: result.message ?? XString.empty,
      toastLength: ft.Toast.LENGTH_SHORT,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
