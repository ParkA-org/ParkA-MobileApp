import "package:flutter/material.dart";

class SymbolButton extends StatelessWidget {
  final Color color;
  final IconData leadingIconData;
  final Function onTapHandler;

  const SymbolButton({
    Key key,
    @required this.color,
    this.onTapHandler,
    this.leadingIconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Icon(
        this.leadingIconData,
        size: 50.0,
        color: this.color,
      ),
    );
  }
}
