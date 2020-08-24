import 'package:ParkA/components/Placeholders/parka_placeholder.dart';
import 'package:flutter/cupertino.dart';
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
    List<Widget> children = new List<Widget>();
    options.forEach((element) {
      children.add(Text(element,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0B768C),
          )));
    });
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      GestureDetector(
        child: ParkAPlaceholder(
          height: height ?? screenSize.height * 0.025,
          width: width ?? screenSize.width * 0.8,
          childAlignment: Alignment.centerRight,
          child: Icon(Icons.arrow_drop_down),
        ),
        onTap: () => {
          showModalBottomSheet(
            builder: (context) => Container(
                height: screenSize.height * 0.35,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    title: Text("$text",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B768C),
                        )),
                    actions: [
                      IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Color(0xFF0B768C),
                          size: 32.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                  body: CupertinoPicker(
                    magnification: 1.2,
                    itemExtent: 60,
                    onSelectedItemChanged: (int value) {},
                    children: children,
                  ),
                )),
            context: context,
          )
        },
      )
    ]));
  }
}
