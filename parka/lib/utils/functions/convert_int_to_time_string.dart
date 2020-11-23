String convertIntToTimeString(int time) {
  if (time == null) {
    return '';
  }

  String temp = time.toString();

  if (temp.length <= 2) {
    while (temp.length != 4) {
      temp = "0" + temp;
    }
  }

  int halfString = (temp.length / 2).truncate();
  // print(halfString);

  String firstPart = temp.substring(0, halfString);
  String secondPart = temp.substring(halfString);

  return '$firstPart:$secondPart';
}
