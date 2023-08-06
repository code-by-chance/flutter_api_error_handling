import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialog {
  CupertinoAlertDialog _createAlertDialog(
      {required BuildContext context,
      required String title,
      required String content}) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
          child: Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  void showAlert(
      {required BuildContext context,
      required String title,
      required String content}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return _createAlertDialog(
              context: context, title: title, content: content);
        });
  }
}
