import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';

class Calendar {
  List<Schedule> monday;
  List<Schedule> tuesday;
  List<Schedule> wednesday;
  List<Schedule> thursday;
  List<Schedule> friday;
  List<Schedule> saturday;
  List<Schedule> sunday;

  Calendar({
    this.friday,
    this.monday,
    this.saturday,
    this.sunday,
    this.thursday,
    this.tuesday,
    this.wednesday,
  });
}
