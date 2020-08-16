import 'package:ParkA/components/Placeholders/parka_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ParkADropdown extends StatelessWidget {
  final String textIcon;
  final Icon buttonIcon;
  final double height;
  final double width;
  final String text;
  final List<String> options;
  final Color textColor;
  final Function onChanged;
  final TextDecoration textDecoration;
  final TextDecoration inputTextDecoration;
  final int textSize;

  const ParkADropdown(
      {Key key,
      this.textIcon,
      this.buttonIcon,
      @required this.text,
      @required this.options,
      this.height,
      this.width,
      this.onChanged,
      this.textDecoration,
      this.inputTextDecoration,
      this.textColor,
      this.textSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        child: Column(children: [
      Row(
        children: <Widget>[
          if (textIcon != null) SvgPicture.asset("resources/images/$textIcon"),
          Text("$text",
              style: (textDecoration ??
                  TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: textSize ?? 14,
                      fontWeight: FontWeight.bold,
                      color: textColor ?? Colors.white)))
        ],
      ),
      SizedBox(
        height: 10,
      ),
      ParkAPlaceholder(
        height: height ?? screenSize.height * 0.025,
        width: width ?? screenSize.width * 0.8,
        child: DropdownButton(
          isExpanded: true,
          icon: buttonIcon ?? Icon(Icons.keyboard_arrow_down),
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged ?? (value) => {},
        ),
      )
    ]));
  }
}
