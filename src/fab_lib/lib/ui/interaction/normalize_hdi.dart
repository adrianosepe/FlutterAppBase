part of fab_lib;

class NormalizeHdi {
  static Future<void> errorOnResult(dynamic result) async {
    if(result.ok) {
      return;
    }

    await ft.Fluttertoast.showToast(
        msg: result.statusMessage,
        toastLength: ft.Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}