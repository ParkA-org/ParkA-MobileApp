import 'package:flutter/material.dart';

class ParkaFloatingActionButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressedHandler;
  final Color color;
  final Color iconColor;

  const ParkaFloatingActionButton({
    Key key,
    this.iconData,
    this.onPressedHandler,
    this.color,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 10.0,
      backgroundColor: color ?? Color(0xff086174),
      child: Icon(
        this.iconData,
        size: 40,
        color: iconColor ?? Colors.white,
      ),
      highlightElevation: 20,
      onPressed: this.onPressedHandler,
    );
  }
}
