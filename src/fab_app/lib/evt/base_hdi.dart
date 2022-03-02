part of fab_app;

class BaseHdi implements IHdi {
  BuildContext get context => BaseContext.currentContext;

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

  @override
  Future<void> alert(String alert) => MessageDialog.alert(context, alert);

  @override
  Future<bool?> question(String question) => MessageDialog.question(context, question);

  Future<TResult?> modal<TResult>(WidgetBuilder builder) {
    return showDialog<TResult?>(
      context: context,
      builder: builder,
    );
  }
}
