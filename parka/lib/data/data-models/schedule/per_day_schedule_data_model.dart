import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';

class PerDaySchedule {
  String id;
  String parkingId;
  List<Schedule> schedules;
  String date;

  PerDaySchedule({
    this.date,
    this.id,
    this.parkingId,
    this.schedules,
  });

  static PerDaySchedule scheduleFromJson(Map<String, dynamic> scheduleData) {
    return new PerDaySchedule(
      date: scheduleData["date"],
      id: scheduleData["id"],
      parkingId: scheduleData["parking"],
      schedules: Schedule.schedulesFromJson(scheduleData["schedules"]),
    );
  }

  static List<PerDaySchedule> schedulesFromJson(List scheduleData) {
    List<PerDaySchedule> ret = new List();

    scheduleData.forEach((element) {
      ret.add(
        PerDaySchedule.scheduleFromJson(element),
      );
    });

    return ret;
  }
}
