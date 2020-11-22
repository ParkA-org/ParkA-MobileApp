import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/styles/text.dart';
import "package:flutter/material.dart";

class ParkaHeader extends StatelessWidget {
  final Color color;
  final Widget leading;
  final Widget central;
  final Widget trailing;

  const ParkaHeader({
    Key key,
    @required this.color,
    this.leading,
    this.central,
    this.trailing,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          this.leading ??
              TransparentButton(
                label: "Atras",
                buttonTextStyle: kParkaInputDefaultSyle,
                color: this.color,
                leadingIconData: Icons.keyboard_arrow_left,
                onTapHandler: () {
                  Navigator.of(context).pop();
                },
              ),
          this.central ?? Container(),
          this.trailing ?? Container()
        ],
      ),
    );
  }
}
