import "package:flutter/material.dart";

class TransparentButton extends StatelessWidget {
  final String label;
  final Color color;
  final IconData leadingIconData;
  final IconData trailingIconData;
  final Function onTapHandler;
  final TextStyle buttonTextStyle;

  const TransparentButton({
    Key key,
    @required this.label,
    @required this.color,
    this.onTapHandler,
    this.leadingIconData,
    this.trailingIconData,
    @required this.buttonTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            this.leadingIconData,
            size: this.leadingIconData != null ? 24.0 : 0,
            color: this.color,
          ),
          Text(
            this.label,
            style: this.buttonTextStyle.copyWith(
                  color: this.color,
                ),
          ),
          Icon(
            this.trailingIconData,
            size: this.trailingIconData != null ? 24.0 : 0,
            color: this.color,
          ),
        ],
      ),
    );
  }
}
