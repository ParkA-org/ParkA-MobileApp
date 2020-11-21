import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';

class Calendar {
  String id;
  String parkingId;
  List<Schedule> monday;
  List<Schedule> tuesday;
  List<Schedule> wednesday;
  List<Schedule> thursday;
  List<Schedule> friday;
  List<Schedule> saturday;
  List<Schedule> sunday;

  Calendar({
    this.id,
    this.parkingId,
    this.friday,
    this.monday,
    this.saturday,
    this.sunday,
    this.thursday,
    this.tuesday,
    this.wednesday,
  });

  static calendarFromJson(Map<String, dynamic> calendarData) {
    return Calendar(
      id: calendarData["id"],
      parkingId: calendarData["parkingId"],
      monday: Schedule.schedulesFromJson(calendarData["monday"]),
      friday: Schedule.schedulesFromJson(calendarData["friday"]),
      saturday: Schedule.schedulesFromJson(calendarData["saturday"]),
      sunday: Schedule.schedulesFromJson(calendarData["sunday"]),
      thursday: Schedule.schedulesFromJson(calendarData["thursday"]),
      tuesday: Schedule.schedulesFromJson(calendarData["tuesday"]),
      wednesday: Schedule.schedulesFromJson(calendarData["wednesday"]),
    );
  }
}
