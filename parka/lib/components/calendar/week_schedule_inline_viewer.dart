import 'package:ParkA/data/data-models/calendar/calendar_data_model.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeekScheduleViewerWidget extends StatelessWidget {
  const WeekScheduleViewerWidget({
    Key key,
    @required Calendar calendar,
  })  : _calendar = calendar,
        super(key: key);

  final Calendar _calendar;

  List<Widget> _viewBuilder() {
    List<Widget> ret = new List();

    weekDaysList.forEach((element) {
      WeekDay _weekDay = weekDays[element];
      List _schedules = this._calendar.getDaySchedule(_weekDay);

      ret.add(
        Expanded(
          child: Container(
            child: Text(
              element.substring(0, 2).capitalizeFirst,
              style: _schedules.length == 0
                  ? kParkaBigButtonTextStyleGreen20
                  : kParkaTextStyleBoldWhite20,
            ),
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _schedules.length == 0
                  ? Colors.white
                  : ParkaColors.parkaGreen,
              border: Border.all(
                color: ParkaColors.parkaGreen,
                width: 2.0,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Calendario",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: this._viewBuilder(),
        )
      ],
    );
  }
}
