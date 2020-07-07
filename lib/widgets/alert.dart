import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

alertDialog(BuildContext context, String title, String description, String button1, Function listener1, String button2, Function listener2) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: <Widget>[
            FlatButton(
              child: Text(button1),
              onPressed: listener1,
            ),
            FlatButton(
              child: Text(button2),
              onPressed: listener2,
            )
          ],
        );
      });
}

alertSimple(BuildContext context, String msg, {Function callback}){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Workout"),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                if(callback != null){
                  callback();
                }
              },
            )
          ],
        );
      });
}