import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/utils/functions/convert_int_to_time_string.dart';
import 'package:flutter/material.dart';
import 'time_selector_pill_widget.dart';
import "package:ParkA/pages/create-reservation/utils/generate_schedule_util.dart";

class TimeSelectorWidget extends StatefulWidget {
  final bool showAddSign;
  final Schedule schedule;
  final Function onChangeHadler;
  final Function onRemoveHadler;
  final int index;
  final bool is24h;

  const TimeSelectorWidget({
    Key key,
    this.showAddSign = true,
    this.schedule,
    this.onChangeHadler,
    this.onRemoveHadler,
    this.index,
    this.is24h,
  }) : super(key: key);

  @override
  _TimeSelectorWidgetState createState() => _TimeSelectorWidgetState();
}

class _TimeSelectorWidgetState extends State<TimeSelectorWidget> {
  Schedule _schedule;
  int _index;
  bool _showAddSign;
  Function _onChangeHadler;
  Function _onRemoveHadler;
  bool _is24h;
  List<String> _startTimes;
  List<String> _endTimes;

  @override
  void initState() {
    super.initState();
    this._schedule = this.widget.schedule;
    this._onChangeHadler = this.widget.onChangeHadler;
    this._onRemoveHadler = this.widget.onRemoveHadler;
    this._index = this.widget.index;
    this._showAddSign = this.widget.showAddSign;
    this._is24h = this.widget?.is24h ?? false;
    this._endTimes = buildRange(30, 2400);
    this._startTimes = buildRange(0, 2330);
  }

  void _setStartTime(int hour) {
    this._schedule = this._schedule ?? new Schedule();

    this._schedule.start = hour;
    if (this._schedule.finish == null) {
      this._schedule.finish = this._schedule.start;
    }

    if (this._schedule.start >= (this._schedule.finish ?? 2500)) {
      this._schedule.finish = this._schedule.start >= 2300 ? 2359 : hour + 100;
    }

    this._schedule.is24h =
        this._schedule.start == 0 && this._schedule.finish == 2359;

    if (this._onChangeHadler != null) {
      this._onChangeHadler(this._schedule, this._index);
    } else {
      setState(() {});
    }
  }

  void _setFinishTime(int hour) {
    hour = hour == 2400 ? 2359 : hour;
    this._schedule = this._schedule ?? new Schedule();

    this._schedule.finish = hour;
    if (this._schedule.start == null) {
      this._schedule.start = this._schedule.finish;
    }

    if (this._schedule.finish < (this._schedule.start ?? 0)) {
      this._schedule.start = this._schedule.finish <= 100 ? 0 : hour - 100;
    }

    this._schedule.is24h =
        this._schedule.start == 0 && this._schedule.finish == 2359;

    if (this._onChangeHadler != null) {
      this._onChangeHadler(this._schedule, this._index);
    } else {
      setState(() {});
    }
  }

  Widget _button() {
    if (this._schedule == null || this._is24h) {
      return Icon(
        Icons.remove,
        color: Colors.transparent,
      );
    }

    if (this._showAddSign) {
      return GestureDetector(
        onTap: () {
          this._onChangeHadler(null, this._index + 1);
        },
        child: Icon(
          Icons.add,
          color: ParkaColors.parkaGreen,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        this._onRemoveHadler(this._index);
      },
      child: Icon(
        Icons.remove,
        color: ParkaColors.parkaLightRed,
      ),
    );
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
              times: this._startTimes,
            ),
          ),
          Expanded(
            child: Icon(Icons.trending_flat),
          ),
          Expanded(
            child: TimeSelectorPillWidget(
              hourString: convertIntToTimeString(this._schedule?.finish),
              setHourString: this._setFinishTime,
              times: this._endTimes,
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: this._button(),
            ),
          ),
        ],
      ),
    );
  }
}
