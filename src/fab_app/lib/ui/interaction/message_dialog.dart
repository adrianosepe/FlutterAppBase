part of fab_app;

class MessageDialog {
  static Future<void> alert(BuildContext context, String message, {String title = 'Atenção', List? details}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: _createMessageContent(context, message, details),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  static Future<bool?> question(BuildContext context, String message,
      {String title = 'Dúvida?', String cancelBtnText = 'Cancelar', String confirmBtnText = 'Continuar', List? details}) async {
    return await showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: _createMessageContent(context, message, details),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(cancelBtnText),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: Text(confirmBtnText),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );
  }

  static Future<bool?> toast(String message, {EToast length = EToast.LENGTH_LONG}) {
    return ft.Fluttertoast.showToast(
      msg: message,
      toastLength: ft.Toast.values[EToast.values.indexOf(length)],
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  static _createMessageContent(BuildContext context, String message, List? details) {
    final widgets = <Widget>[];

    widgets.add(
      Text(
        message,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );

    details?.forEach(
      (msg) {
        widgets.add(
          Text(
            msg,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        );
      },
    );

    return widgets;
  }
}

enum EToast { LENGTH_SHORT, LENGTH_LONG }
