// Author: Silvio Arzeno
//
// Date: 8/3/2020
//
// Description: A generic Input Widget that takes Icon, text , IsPassword
// As well as preffered text color or text decoration. Default Values are
// Icon: WhiteProfileIcon.svg
// Text: Correo/ Usuario
// Text Decorations: Monserrat, White, 16, Bold
//
// Change Log:
// -8/3/2020 Silvio Arzeno: Widget created
//

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ParkAInput extends StatelessWidget {
  const ParkAInput(
      {Key key,
      this.icon,
      this.text,
      this.isPassword,
      this.textColor,
      this.textDecoration})
      : super(key: key);

  final String icon;
  final String text;
  final bool isPassword;
  final Color textColor;
  final TextDecoration textDecoration;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SvgPicture.asset("resources/images/$icon"),
        const Spacer(),
        Text("$text",
            style: const TextStyle(
                fontFamily: "Montserrat",
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        const Spacer(
          flex: 7,
        )
      ],
    );
  }
}
