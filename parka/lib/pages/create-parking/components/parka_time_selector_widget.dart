import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/utils/functions/convert_int_to_time_string.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class TimeSelectorWidget extends StatefulWidget {
  final bool showAddSign;
  final Schedule schedule;
  final Function onChangeHadler;
  final Function onRemoveHadler;
  final index;

  const TimeSelectorWidget({
    Key key,
    this.showAddSign = true,
    this.schedule,
    this.onChangeHadler,
    this.onRemoveHadler,
    this.index,
  }) : super(key: key);

  @override
  _TimeSelectorWidgetState createState() => _TimeSelectorWidgetState();
}

class _TimeSelectorWidgetState extends State<TimeSelectorWidget> {
  Schedule _schedule;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._schedule = this.widget.schedule ?? new Schedule();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TimeSelectorPillWidget(
              hourString: convertIntToTimeString(this._schedule?.start),
              setHourString: (int hour) {
                if (this.widget.onChangeHadler != null) {
                  print(this.widget.index);
                  this.widget.onChangeHadler(this._schedule, this.widget.index);
                }

                setState(() {
                  this._schedule.start = hour;
                  if (this._schedule.start > (this._schedule.finish ?? 2500)) {
                    this._schedule.finish =
                        this._schedule.start >= 2300 ? 2400 : hour + 100;
                  }
                });
              },
            ),
          ),
          Expanded(
            child: Icon(Icons.trending_flat),
          ),
          Expanded(
            child: TimeSelectorPillWidget(
              hourString: convertIntToTimeString(this._schedule?.finish),
              setHourString: (int hour) {
                setState(() {
                  this._schedule.finish = hour;
                  if (this._schedule.finish < this._schedule.start) {
                    this._schedule.start =
                        this._schedule.finish <= 100 ? 0 : hour - 100;
                  }
                });
              },
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                onTap: () {
                  this.widget.onRemoveHadler(this.widget.index);
                },
                child: this.widget.schedule == null
                    ? Container()
                    : Icon(Icons.remove,
                        color: this._schedule == null
                            ? Colors.transparent
                            : ParkaColors.parkaLightRed),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
    print(this.hourString);

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
