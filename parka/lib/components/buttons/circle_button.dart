import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color borderColor;
  final Color fillColor;
  final Icon icon;
  final BoxDecoration decoration;
  final String text;
  final TextStyle textStyle;
  final double fontSize;
  final Function onTap;

  const CircleButton(
      {Key key,
      this.borderColor,
      this.fillColor,
      this.icon,
      this.decoration,
      this.text,
      this.textStyle,
      this.fontSize,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Expanded(
          child: Container(
              width: 100,
              decoration: decoration ??
                  BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0.0, 5.0),
                          color: Colors.grey[700],
                        )
                      ],
                      border: Border.all(
                          color: borderColor ?? ParkaColors.parkaGreen),
                      color: fillColor ?? ParkaColors.parkaGreen),
              child: Center(
                child: icon ??
                    Icon(Icons.calendar_today_outlined,
                        color: Colors.white, size: 35),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text ?? "Reservar",
          style: textStyle ??
              kParkaTextStyleBoldGreen18.copyWith(fontSize: fontSize ?? 16.0),
        )
      ]),
    );
  }
}
