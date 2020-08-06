import "package:flutter/material.dart";

class TransparentButton extends StatelessWidget {
  final String label;
  final Function onTapHandler;

  const TransparentButton({this.label, this.onTapHandler});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Text(
        this.label,
        style: TextStyle(
            color: Color(0xFF0B768C),
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
