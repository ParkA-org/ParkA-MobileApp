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

import 'package:ParkA/components/place-holders/parka_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ParkADatePicker extends StatelessWidget {
  ParkADatePicker({
    Key key,
    this.icon,
    @required this.text,
    this.textColor,
    this.textDecoration,
    this.inputHeight,
    this.inputWidth,
    this.textSize,
    this.onChanged,
    this.selectedDate,
  }) : super(key: key);

  final String icon;
  final String text;
  final Color textColor;
  final TextDecoration textDecoration;
  final double inputHeight;
  final double inputWidth;
  final double textSize;
  final Function onChanged;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    Size currentScreen = MediaQuery.of(context).size;
    String formattedDate =
        selectedDate == null ? null : DateFormat.yMMMd().format(selectedDate);
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
                style: (textDecoration ??
                    TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: textSize ?? 16,
                      fontWeight: FontWeight.bold,
                      color: textColor ?? Colors.white,
                    )),
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
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: Offset(0, 10),
                  color: Color(
                    0x40000000,
                  ),
                )
              ],
            ),
            height: inputHeight ?? currentScreen.height * 0.06,
            width: inputWidth ?? currentScreen.width * 0.75,
            child: GestureDetector(
              child: ParkAPlaceholder(
                color: Colors.white,
                childAlignment: Alignment.centerLeft,
                height: inputHeight ?? currentScreen.height * 0.06,
                width: inputWidth ?? currentScreen.height * 0.2,
                child: selectedDate != null
                    ? Text(
                        "$formattedDate",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    : null,
              ),
              onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  height: currentScreen.height * 0.40,
                  child: DatePickerWidget(
                    onConfirm: onChanged ?? {},
                    dateFormat: 'dd/MM/yyyy',
                    initialDateTime: selectedDate == null
                        ? DateTime(DateTime.now().year - 18)
                        : selectedDate,
                    maxDateTime: DateTime.now(),
                    pickerTheme: DateTimePickerTheme(
                      itemTextStyle: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(
                          0xFF0B768C,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
