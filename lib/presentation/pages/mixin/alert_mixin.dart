import 'package:flutter/material.dart';

mixin AlertMixin<T extends StatefulWidget> on State<T> {
  void showAlertWithFunction({
    required String? title,
    required String? content,
    Function? function,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(content!, style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context, "OK");
                if (function != null) function();
              },
            ),
          ],
        );
      },
    );
  }

  void showAlert2(
      {required String? title,
      required String? content,
      // bool isFunction = false,
      bool isFunction = false,
      bool isOptionBtn = false,
      Function? function}) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(content!, style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            if (isFunction)
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context, "OK");
                  function!();
                },
              ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, "Cancel");
              },
            ),
          ],
        );
      },
    );
  }
}
