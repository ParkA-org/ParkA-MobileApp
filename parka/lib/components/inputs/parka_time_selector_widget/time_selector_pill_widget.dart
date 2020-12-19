import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class TimeSelectorPillWidget extends StatelessWidget {
  final String hourString;
  final Function setHourString;
  final List<String> times;

  const TimeSelectorPillWidget({
    Key key,
    this.hourString,
    this.setHourString,
    @required this.times,
  }) : super(key: key);

  List<Widget> optionsBuilder() {
    List<Widget> ret = new List();

    this.times.forEach((String element) {
      ret.add(
        Center(
          child: Text(element),
        ),
      );
    });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => Container(
            child: Scaffold(
              backgroundColor: Colors.white,
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
              body: CupertinoPicker(
                  backgroundColor: Colors.white,
                  scrollController: FixedExtentScrollController(
                    initialItem: 0,
                  ),
                  itemExtent: 60,
                  onSelectedItemChanged: (int value) {
                    String _hour = this.times[value].substring(0, 2);
                    String _minutes = this.times[value].substring(2);

                    int hour = int.tryParse('${_hour}${_minutes}');

                    if (this.setHourString != null) {
                      this.setHourString(hour);
                    }
                  },
                  children: optionsBuilder()),
            ),
          ),
        );
      },
      child: Container(
        child: AutoSizeText(
          this.hourString ?? "",
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
