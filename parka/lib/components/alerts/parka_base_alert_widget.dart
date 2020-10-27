import "package:flutter/material.dart";

class BaseAlertWidget extends StatelessWidget {
  final Widget child;
  final List<Widget> actions;

  const BaseAlertWidget({
    Key key,
    this.child,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xFF0B768C),
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: this.child,
      actions: this.actions,
    );
  }
}
