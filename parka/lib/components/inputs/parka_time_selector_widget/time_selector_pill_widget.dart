import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class TimeSelectorPillWidget extends StatelessWidget {
  final String hourString;
  final Function setHourString;

  const TimeSelectorPillWidget({
    Key key,
    this.hourString,
    this.setHourString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          builder: (BuildContext context) => Container(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                elevation: 0,
                title: Text(
                  "Elige un horario",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B768C),
                  ),
                ),
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
              body: TimePickerWidget(
                dateFormat: 'HH/mm',
                onChange: (DateTime timeString, List<int> timeArray) {
                  String minutes = timeArray[1] < 10
                      ? '0${timeArray[1]}'
                      : "${timeArray[1]}";
                  int hour = int.tryParse('${timeArray[0]}$minutes');
                  // print(timeArray);
                  // print(hour);
                  if (this.setHourString != null) {
                    this.setHourString(hour);
                  }
                },
              ),
            ),
          ),
          context: context,
        );
      },
      child: Container(
        child: AutoSizeText(
          this.hourString,
          maxLines: 1,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
            color: Color(0xFFC4C4C4),
            borderRadius: BorderRadius.circular(16.0)),
      ),
    );
  }
}
