import "package:flutter/material.dart";

class TransparentButtonWithIcon extends StatelessWidget {
  final String label;
  final Color color;

  const TransparentButtonWithIcon({Key key, this.label, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.arrow_forward_ios,
          textDirection: TextDirection.rtl,
          color: this.color,
        ),
        Text(
          this.label,
          style: TextStyle(
            color: this.color,
          ),
        ),
      ],
    );
  }
}

class TransparentButtonWithRightIcon extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  const TransparentButtonWithRightIcon(
      {Key key, this.label, this.color, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.label,
          style: TextStyle(
            fontSize: 20.0,
            color: this.color,
          ),
        ),
        Icon(
          this.icon,
          size: this.icon != null ? 24.0 : 0,
          color: this.color,
        ),
      ],
    );
  }
}
