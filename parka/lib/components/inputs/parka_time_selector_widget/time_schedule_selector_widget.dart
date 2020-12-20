import 'package:ParkA/components/inputs/parka_time_selector_widget/time_selector_widget.dart';
import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class TimeScheduleSelectorWidget extends StatelessWidget {
  final String label;
  final List<Schedule> schedules;
  final Function onChange;
  final Function onRemove;
  final Function onLabelTap;

  const TimeScheduleSelectorWidget({
    Key key,
    @required this.label,
    @required this.schedules,
    this.onChange,
    this.onRemove,
    this.onLabelTap,
  }) : super(key: key);

  List<Widget> selectorBuilder() {
    List<Widget> ret = new List();

    int i = 0;
    this.schedules.forEach((element) {
      ret.add(
        TimeSelectorWidget(
          key: Key(DateTime.now().toIso8601String()),
          showAddSign: (i < 2 && this.schedules.length < 2),
          is24h: element?.is24h ?? false,
          schedule: element,
          index: i,
          onChangeHadler: this.onChange,
          onRemoveHadler: this.onRemove,
        ),
      );
      i++;
    });

    if (ret.length == 0) {
      ret.add(
        TimeSelectorWidget(
          key: Key((ret.length + 5).toString()),
          onChangeHadler: this.onChange,
          index: ret.length,
        ),
      );
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 16.0,
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                margin: EdgeInsets.only(left: 24.0),
                // padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: this.schedules.length == 0
                      ? Colors.white
                      : ParkaColors.parkaLightGrey,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 28.0),
                  child: Column(
                    children: this.selectorBuilder(),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => this.onLabelTap(this.schedules.length != 0),
                child: Container(
                  child: Text(
                    this.label.substring(0, 2),
                    style: this.schedules.length == 0
                        ? kParkaBigButtonTextStyleGreen22
                        : kParkaBigButtonTextStyle,
                  ),
                  height: 50.0,
                  width: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: this.schedules.length == 0
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
            ],
          )
        ],
      ),
    );
  }
}
