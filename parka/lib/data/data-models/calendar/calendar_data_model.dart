import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';

const List<String> weekDaysList = [
  "lunes",
  "martes",
  "miercoles",
  "jueves",
  "viernes",
  "sabado",
  "domingo",
];

enum WeekDay {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

const Map<String, WeekDay> weekDays = {
  "lunes": WeekDay.Monday,
  "martes": WeekDay.Tuesday,
  "miercoles": WeekDay.Wednesday,
  "jueves": WeekDay.Thursday,
  "viernes": WeekDay.Friday,
  "sabado": WeekDay.Saturday,
  "domingo": WeekDay.Sunday,
};

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

  List<Schedule> getDaySchedule(WeekDay _weekDay) {
    switch (_weekDay) {
      case WeekDay.Monday:
        return this.monday;
      case WeekDay.Tuesday:
        return this.tuesday;
      case WeekDay.Wednesday:
        return this.wednesday;
      case WeekDay.Thursday:
        return this.thursday;
      case WeekDay.Friday:
        return this.friday;
      case WeekDay.Saturday:
        return this.saturday;
      case WeekDay.Sunday:
        return this.sunday;
      default:
        return this.friday; // Cause I rather it always be friday
    }
    return new List();
  }
}
