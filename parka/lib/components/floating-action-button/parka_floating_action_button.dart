import 'package:flutter/material.dart';

class ParkaFloatingActionButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressedHandler;

  const ParkaFloatingActionButton({
    Key key,
    this.iconData,
    this.onPressedHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 10.0,
      backgroundColor: Color(0xff086174),
      child: Icon(
        this.iconData,
        size: 40,
      ),
      highlightElevation: 20,
      onPressed: this.onPressedHandler,
    );
  }
}
