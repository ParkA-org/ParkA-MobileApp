import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeSelectorPillWidget extends StatelessWidget {
  final String hourString;
  final Function setHourString;
  final List<String> times;

  const TimeSelectorPillWidget({
    Key key,
    @required this.hourString,
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

  int _getIndex() {
    if (this.hourString == null || this.hourString.length == 0) {
      return 0;
    }

    List<String> parts = this.hourString.split(":");

    String _part1 = parts[0].length == 1 ? "0${parts[0]}" : parts[0];
    String _part2 = parts[1].length == 1 ? "0${parts[1]}" : parts[1];

    String _check = '$_part1$_part2';

    if (_check == "2359") {
      return this.times.length - 1;
    }

    int idx = this.times.indexOf(_check);

    return idx;
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
                    initialItem: _getIndex(),
                  ),
                  itemExtent: 60,
                  onSelectedItemChanged: (int value) {
                    String _hour = this.times[value].substring(0, 2);
                    String _minutes = this.times[value].substring(2);

                    int hour = int.tryParse('$_hour$_minutes');

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
