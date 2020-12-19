import 'package:flutter/material.dart';

class ParkaFloatingActionButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressedHandler;
  final Color color;
  final Color iconColor;
  final bool enabled;
  final bool diferentUser;

  const ParkaFloatingActionButton(
      {Key key,
      this.iconData,
      this.onPressedHandler,
      this.color,
      this.iconColor,
      this.enabled,
      this.diferentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: diferentUser != true
            ? Visibility(
                visible: enabled ?? true,
                child: FloatingActionButton(
                  elevation: 10.0,
                  backgroundColor: color ?? Color(0xff086174),
                  child: Icon(
                    this.iconData,
                    size: 40,
                    color: iconColor ?? Colors.white,
                  ),
                  highlightElevation: 20,
                  onPressed: this.onPressedHandler,
                ),
              )
            : Visibility(
                visible: diferentUser ?? true,
                child: GestureDetector(
                  onTap: this.onPressedHandler,
                  child: FloatingActionButton(
                    elevation: 10.0,
                    backgroundColor: color ?? Color(0xff086174),
                    child: Container(
                      child: Icon(Icons.calendar_today_outlined,
                          size: 35, color: Colors.white),
                    ),
                    highlightElevation: 20,
                    onPressed: this.onPressedHandler,
                  ),
                ),
              ));
  }
}
