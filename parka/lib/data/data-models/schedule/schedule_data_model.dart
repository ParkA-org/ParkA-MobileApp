class Schedule {
  int start;
  int finish;
  bool is24h;

  Schedule({
    this.start,
    this.finish,
    this.is24h,
  });

  static scheduleFromJson(Map<String, dynamic> scheduleData) {
    return Schedule(
      finish: scheduleData["finish"],
      start: scheduleData["start"],
    );
  }

  static List<Schedule> schedulesFromJson(List schedulesData) {
    List<Schedule> ret = new List();

    schedulesData.forEach((element) {
      ret.add(Schedule.scheduleFromJson(element));
    });

    return ret;
  }

  Map<String, dynamic> toJson() => {
        'start': this.start,
        'finish': this.finish,
      };

  static List toJsonArray(List<Schedule> _schedules) {
    List ret = new List();

    _schedules.forEach((element) {
      if (element != null) {
        ret.add(element.toJson());
      }
    });

    return ret;
  }
}
