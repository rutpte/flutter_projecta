import 'package:flutter/material.dart';

Future<void> normalDialog(
    BuildContext context, String title, String msg) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              onPressed: (){
                Navigator.of(context).pop();//--> hide popup.
              },
            )
          ],
        );
      });
}
