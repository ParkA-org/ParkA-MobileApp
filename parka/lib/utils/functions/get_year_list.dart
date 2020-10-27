List<String> getYearsList(int maxYear) {
  List<String> ret = new List();

  for (int i = 1970; i <= maxYear; i++) {
    ret.add(i.toString());
  }

  return ret;
}
