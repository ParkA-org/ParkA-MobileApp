class Schedule {
  int start;
  int finish;
  bool is24h;

  Schedule({
    this.start,
    this.finish,
    this.is24h,
  });

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
