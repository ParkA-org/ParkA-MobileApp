import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/utils/functions/convert_int_to_time_string.dart';
import 'package:flutter/material.dart';
import 'time_selector_pill_widget.dart';

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
  int _index;
  Function _onChangeHadler;
  Function _onRemoveHadler;

  @override
  void initState() {
    super.initState();
    this._schedule = this.widget.schedule;
    this._onChangeHadler = this.widget.onChangeHadler;
    this._onRemoveHadler = this.widget.onRemoveHadler;
    this._index = this.widget.index;
  }

  void _setStartTime(int hour) {
    this._schedule = this._schedule ?? new Schedule();

    this._schedule.start = hour;
    if (this._schedule.finish == null) {
      this._schedule.finish = this._schedule.start;
    }

    if (this._schedule.start >= (this._schedule.finish ?? 2500)) {
      this._schedule.finish = this._schedule.start >= 2300 ? 2400 : hour + 100;
    }

    if (this._onChangeHadler != null) {
      this._onChangeHadler(this._schedule, this._index);
    } else {
      setState(() {});
    }
  }

  void _setFinishTime(int hour) {
    this._schedule = this._schedule ?? new Schedule();

    this._schedule.finish = hour;
    if (this._schedule.start == null) {
      this._schedule.start = this._schedule.finish;
    }

    if (this._schedule.finish < (this._schedule.start ?? 0)) {
      this._schedule.start = this._schedule.finish <= 100 ? 0 : hour - 100;
    }

    if (this._onChangeHadler != null) {
      this._onChangeHadler(this._schedule, this._index);
    } else {
      setState(() {});
    }
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
              setHourString: this._setStartTime,
            ),
          ),
          Expanded(
            child: Icon(Icons.trending_flat),
          ),
          Expanded(
            child: TimeSelectorPillWidget(
              hourString: convertIntToTimeString(this._schedule?.finish),
              setHourString: this._setFinishTime,
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: this._schedule == null
                  ? Icon(
                      Icons.remove,
                      color: Colors.transparent,
                    )
                  : GestureDetector(
                      onTap: () {
                        this._onRemoveHadler(this._index);
                      },
                      child: Icon(
                        Icons.remove,
                        color: ParkaColors.parkaLightRed,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
