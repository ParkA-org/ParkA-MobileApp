import "package:flutter/material.dart";

Future buildShowDialog(BuildContext context, Widget alertDialog) {
  return showDialog(
    context: context,
    builder: (context) => alertDialog,
  );
}
