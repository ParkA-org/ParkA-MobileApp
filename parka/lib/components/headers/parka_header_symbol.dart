import 'package:ParkA/components/buttons/symbol_button.dart';
import "package:flutter/material.dart";

class ParkaHeaderSymbol extends StatelessWidget {
  final Color color;
  final Widget leading;

  const ParkaHeaderSymbol({
    Key key,
    @required this.color,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        iconTheme: IconThemeData(
          color: this.color,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this.leading ??
              SymbolButton(
                color: this.color,
                leadingIconData: Icons.clear,
                onTapHandler: () {
                  Navigator.pop(context);
                },
              ),
        ],
      ),
    );
  }
}
