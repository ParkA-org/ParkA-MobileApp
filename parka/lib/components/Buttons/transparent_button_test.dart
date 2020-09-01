import "package:flutter/material.dart";

class TransparentButtonWithIcon extends StatelessWidget {
  final String label;
  final Color color;
  final Function onTapHandler;

  const TransparentButtonWithIcon({
    Key key,
    this.label,
    this.color,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Row(
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
      ),
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
            fontWeight: FontWeight.bold,
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
