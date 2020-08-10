import "package:flutter/material.dart";

class TransparentButton extends StatelessWidget {
  final String label;
  final Function onTapHandler;
  final TextStyle buttonTextStyle;

  const TransparentButton(
      {this.label, this.onTapHandler, this.buttonTextStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Text(
        this.label,
        style: this.buttonTextStyle,
      ),
    );
  }
}
