import 'package:ParkA/components/Buttons/transparent_button_test.dart';
import "package:flutter/material.dart";

class ParkaHeader extends StatelessWidget {
  const ParkaHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TransparentButton(
          label: "Atras",
          color: Color(0xFF0B768C),
          leadingIconData: Icons.keyboard_arrow_left,
          onTapHandler: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
