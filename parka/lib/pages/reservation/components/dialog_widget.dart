import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

// ignore: non_constant_identifier_names
Future<YYDialog> YYDialogDemo(BuildContext context, Size screenSize) async {
  return YYDialog().build(context)
    ..width = 300.00
    ..height = 400.00
    ..widget(
      Padding(
        padding: EdgeInsets.all(0.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Prueba tu jevita text",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    )
    ..show();
}
