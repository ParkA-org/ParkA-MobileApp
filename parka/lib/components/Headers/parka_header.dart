import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import "package:flutter/material.dart";

class ParkaHeader extends StatelessWidget {
  final Color color;

  const ParkaHeader({
    @required this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TransparentButton(
          label: "Atras",
          buttonTextStyle: kParkaInputDefaultSyle,
          color: this.color,
          leadingIconData: Icons.keyboard_arrow_left,
          onTapHandler: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
