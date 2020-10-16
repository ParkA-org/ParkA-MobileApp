class Color {
  String id;
  String name;

  Color({
    this.id,
    this.name,
  });

  static colorsFromJson(List colorsData) {
    List<Color> ret = new List<Color>();

    colorsData.forEach((element) {
      ret.add(
        Color(
          id: element["id"],
          name: element["name"],
        ),
      );
    });

    return ret;
  }
}
