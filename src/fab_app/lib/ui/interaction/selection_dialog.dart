import 'package:fab_app/fab_app.dart';
import 'package:flutter/material.dart';

class SelectionDialog {
  static Future<TValue?> selectUsing<TValue>(BuildContext context, List<IconOption<TValue>> options) {
    return showModalBottomSheet<TValue>(
      backgroundColor: Theme.of(context).primaryColor,
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: options
                .map(
                  (e) => ListTile(
                    leading: Icon(e.icon, color: Colors.white),
                    title: Text(e.text, style: TextStyle(fontSize: 22)),
                    onTap: () => Navigator.of(context).pop(e.value),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
