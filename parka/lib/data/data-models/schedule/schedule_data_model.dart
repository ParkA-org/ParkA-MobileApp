class Schedule {
  int start;
  int finish;

  Schedule({
    this.start,
    this.finish,
  });

  Map<String, dynamic> toJson() => {
        'start': this.start,
        'finish': this.finish,
      };

  static List toJsonArray(List<Schedule> _schedules) {
    List ret = new List();

    _schedules.forEach((element) {
      ret.add(element.toJson());
    });

    return ret;
  }
}
