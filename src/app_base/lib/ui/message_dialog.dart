import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;

class MessageDialog {
	static Future<void> alert(BuildContext context, String message, {String title = 'Atenção', List details}) async {
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
						FlatButton(
							child: Text('OK'),
							onPressed: () {
								Navigator.of(context).pop();
							},
						),
					],
				);
			},
		);
	}

	static Future<bool> question(BuildContext context, String message, {String title = 'Dúvida?', List details}) async {
		bool result = false;

		await showDialog<void>(
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
						FlatButton(
							child: Text('Cancelar'),
							onPressed: () {
								Navigator.of(context).pop();
							},
						),
						FlatButton(
							child: Text('Continuar'),
							onPressed: () {
								result = true;
							  Navigator.of(context).pop();
							},
						),
					],
				);
			},
		);

		return result;
	}

	static Future<void> toast(String message, { Toast length = Toast.LENGTH_LONG}) async {
		await ft.Fluttertoast.showToast(
				msg: message,
				toastLength: ft.Toast.values[Toast.values.indexOf(length)],
				backgroundColor: Colors.red,
				textColor: Colors.white);
	}

	static _createMessageContent(BuildContext context, String message, List details) {
		final widgets = List<Widget>();

		widgets.add(Text(
			message,
			style: Theme
					.of(context)
					.textTheme
					.subtitle2,));

		details?.forEach(
						(msg) {
					widgets.add(Text(
						msg,
						style: Theme
								.of(context)
								.textTheme
								.subtitle2,));
				});

		return widgets;
	}
}

enum Toast { LENGTH_SHORT, LENGTH_LONG }