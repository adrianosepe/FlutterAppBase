import 'package:app_base/service/result.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NormalizeHdi {
  static Future<void> errorOnResult(Result result) async {
    if(result.ok) {
      return;
    }

    await Fluttertoast.showToast(
        msg: result.message,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}