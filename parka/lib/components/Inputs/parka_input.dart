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
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ParkAInput extends StatelessWidget {
  ParkAInput(
      {Key key,
      this.icon,
      @required this.text,
      this.isPassword,
      this.textColor,
      this.textDecoration,
      this.keyboardType})
      : super(key: key);

  final String icon;
  final String text;
  final bool isPassword;
  final Color textColor;
  final TextDecoration textDecoration;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 5),
          Row(children: <Widget>[
            if (icon != null) SvgPicture.asset("resources/images/$icon"),
            if (icon != null) Spacer(),
            Text("$text",
                style: (textDecoration ??
                    TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: textColor ?? Colors.white))),
            Spacer(
              flex: 13,
            ),
          ]),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            child: TextFormField(
              style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              obscureText: isPassword ?? false,
              keyboardType: keyboardType ?? TextInputType.emailAddress,
              decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  fillColor: Color(0xFFD7D2D2),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
        ],
      ),
    );
  }
}
