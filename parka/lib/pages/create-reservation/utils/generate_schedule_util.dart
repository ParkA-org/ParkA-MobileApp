import 'package:ParkA/data/data-models/calendar/calendar_data_model.dart';
import 'package:ParkA/data/data-models/schedule/per_day_schedule_data_model.dart';
import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';

class ReservationSchedule {
  int rangeIdx;
  int maxRangeValueIdx;
  int minRangeValueIdx;
  String value;

  ReservationSchedule({
    this.minRangeValueIdx,
    this.maxRangeValueIdx,
    this.rangeIdx,
    this.value,
  });
}

class ReservationScheduleList {
  List<ReservationSchedule> start;
  List<ReservationSchedule> finish;

  ReservationScheduleList({
    this.finish,
    this.start,
  });
}

String formatDate(DateTime date) {
  int day = date.day;
  int month = date.month;
  int year = date.year;

  return new DateTime(year, month, day).toIso8601String();
}

ReservationScheduleList getParkingAvaliableSchedule(
  DateTime _date,
  Calendar _parkingCalendar,
  List<PerDaySchedule> _parkingSchedule,
) {
  List<Schedule> ret = new List();
  String filterDate = '${formatDate(_date)}Z';
  List<Schedule> busySchedule = [];

  // print("STARTS HERE");

  int idx =
      _parkingSchedule.indexWhere((element) => element.date == filterDate);

  // print(filterDate);
  // _parkingSchedule.forEach((element) {
  //   print(element.date);
  // });

  // print("INDEX IS $idx");

  if (idx != -1) {
    busySchedule = _parkingSchedule[idx].schedules;
  }

  int dayIdx = _date.weekday - 1;

  List<Schedule> _scheduleDay =
      _parkingCalendar.getDaySchedule(weekDays[weekDaysList[dayIdx]]);
  // print("LEN IS ${_scheduleDay.length}");
  // print("DAY IS ${weekDaysList[dayIdx]}");

  ret = busySchedule.length == 0
      ? _scheduleDay
      : _getAvaliableSchedule(
          _scheduleDay,
          busySchedule,
        );

  // ret.forEach((element) {
  //   print("SCHEDULE IS ${element.start} : ${element.finish}");
  // });

  return _formatTimeSchedules(ret);
}

List<Schedule> _getAvaliableSchedule(
  List<Schedule> _parkingScheduleDay,
  List<Schedule> _parkingBusyHours,
) {
  List<Schedule> ret = new List();

  // print("PARKING SCHEDULE");
  // for (Schedule _scheduleDay in _parkingScheduleDay) {
  //   print("${_scheduleDay.start}  ${_scheduleDay.finish}");
  // }

  // print("PARKING OCCUPIED HOURS");
  // for (Schedule _schedule in _parkingBusyHours) {
  //   print("${_schedule.start}  ${_schedule.finish}");
  // }

  int pointer = 0;
  for (Schedule _schedule in _parkingScheduleDay) {
    Schedule _curr = new Schedule(
      finish: _schedule.finish,
      start: _schedule.start,
    );

    // print("LOOP STARTS HERE");
    // print(_parkingBusyHours.length);
    while (pointer != _parkingBusyHours.length) {
      // print("RET LEN IS ${ret.length}");
      // ret.forEach((element) {
      //   print("FREE SCHEDULE IS ${element.start} - ${element.finish} ");
      // });

      Schedule _busySchedule = new Schedule(
        finish: _parkingBusyHours[pointer].finish,
        start: _parkingBusyHours[pointer].start,
      );

      // print("PARKING SCHEDULE");
      // print("${_curr.start} ${_curr.finish}");
      // print("PARKING OCCUPIED HOURS");
      // print("${_busySchedule.start} ${_busySchedule.finish}");

      if (_curr.start == _busySchedule.start &&
          _curr.finish > _busySchedule.finish) {
        // print("HERE");

        _curr.start = _busySchedule.finish;
      } else if (_curr.start < _busySchedule.start &&
          _curr.finish > _busySchedule.finish) {
        // print("HERE 2");
        // print("PARKING SCHEDULE");

        Schedule _toAdd = new Schedule(
          start: _curr.start,
          finish: _busySchedule.start,
        );
        // print("${_toAdd.start} ${_toAdd.finish}");

        ret.add(_toAdd);

        _curr.start = _busySchedule.finish;
      } else {
        // ret.add(_curr);
        break;
      }

      pointer++;
    }
    ret.add(_curr);
  }

  // print("RET FINAL LENGTH ${ret.length}");

  return ret;
}

ReservationScheduleList _formatTimeSchedules(List<Schedule> _schedules) {
  List<ReservationSchedule> _start = new List();
  List<ReservationSchedule> _finish = new List();

  List<String> _startCheck = new List();
  List<String> _finishCheck = new List();

  int _rangeIdx = 0;
  int rangeMaxIndex = 0;
  int rangeMinIndex = 0;
  _schedules.forEach((element) {
    List<String> _range = _getRange(element);
    int idx = 0;
    rangeMinIndex += rangeMaxIndex + (_rangeIdx > 0 ? 1 : 0);
    rangeMaxIndex += _range.length - 2 + (_rangeIdx > 0 ? 1 : 0);

    print("RANGE IS  $_rangeIdx");
    print("SUM 1 ${_rangeIdx == 0}");
    print("MIN IN RANGE IS $rangeMinIndex");
    print("MAX IN RANGE IS $rangeMaxIndex");
    print("RANGE LENGTH IS ${_range.length}");
    // _range.forEach((element) {
    //   print(element);
    // });

    // print(rangeMinIndex);
    // print(rangeMaxIndex);
    // print(_rangeIdx);
    // print(_range.length);
    _range.forEach((element) {
      String _firstPart = element.substring(0, 2);
      String _secondPart = element.substring(2);
      String _value = "$_firstPart:$_secondPart";

      ReservationSchedule curr = new ReservationSchedule(
        rangeIdx: _rangeIdx,
        value: _value,
        maxRangeValueIdx: rangeMaxIndex,
        minRangeValueIdx: rangeMinIndex,
      );

      if (idx != 0) {
        _finish.add(curr);
        _finishCheck.add(element);
      }

      if (idx != _range.length - 1) {
        _start.add(curr);
        _startCheck.add(element);
      }
      idx++;
    });
    _rangeIdx++;

    // if (_range.length > 0) print(_finish[rangeMaxIndex].value);
  });

  // print(_startCheck);
  // print(_finishCheck);

  return ReservationScheduleList(
    finish: _finish,
    start: _start,
  );
}

List<String> _getRange(Schedule _schedule) {
  return _buildRange(_schedule.start, _schedule.finish);
}

List<String> _buildRange(int _start, int _end) {
  List<String> ret = new List();

  String _startHour = _start.toString();

  int len = _startHour.length;

  if (len == 1) {
    _startHour = "000" + _startHour;
  } else if (len == 2) {
    _startHour = "00" + _startHour;
  } else if (len == 3) {
    _startHour = "0" + _startHour;
  }

  String hour = _startHour;
  int pointer = 0;

  while (pointer <= _end) {
    ret.add(hour);

    String firstPart = hour.substring(0, 2);
    String secondPart = hour.substring(2);

    int sum2 = int.tryParse(secondPart);
    int sum1 = int.tryParse(firstPart);
    sum2 += 30;

    if (sum2 == 60) {
      sum1 += 1;
      secondPart = "00";
    } else {
      secondPart = sum2.toString();
    }

    firstPart = sum1.toString();
    firstPart = firstPart.length == 1 ? "0$firstPart" : firstPart;

    hour = firstPart + secondPart;

    pointer = int.tryParse(hour);
  }

  return ret;
}
