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

import 'package:ParkA/styles/inputs.dart';
import 'package:ParkA/styles/text.dart';
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
      this.keyboardType,
      this.inputHeight,
      this.inputWidth,
      this.onChanged})
      : super(key: key);

  final String icon;
  final String text;
  final bool isPassword;
  final Color textColor;
  final TextDecoration textDecoration;
  final TextInputType keyboardType;
  final double inputHeight;
  final double inputWidth;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    Size currentScreen = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5),
          Row(
            children: <Widget>[
              if (icon != null) SvgPicture.asset("resources/images/$icon"),
              if (icon != null) Spacer(),
              Text(
                "$text",
                style: (textDecoration ?? kParkaInputDefaultSyle),
              ),
              Spacer(
                flex: 10,
              ),
            ],
          ),
          SizedBox(
            height: currentScreen.height * 0.005,
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: Offset(0, 10),
                  color: Color(0x40000000),
                )
              ],
            ),
            height: inputHeight ?? currentScreen.height * 0.06,
            width: inputWidth ?? currentScreen.height * 0.5,
            child: TextFormField(
              onChanged: onChanged ?? (value) {},
              style: kParkaInputTextStyle,
              obscureText: isPassword ?? false,
              keyboardType: keyboardType ?? TextInputType.emailAddress,
              decoration: kParkaInputTextFieldDefaultStyle,
            ),
          ),
        ],
      ),
    );
  }
}
