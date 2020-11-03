class BodyStyle {
  String id;
  String name;

  BodyStyle({
    this.id,
    this.name,
  });

  static bodyStylesFromJson(List bodyStyleData) {
    List<BodyStyle> ret = new List<BodyStyle>();

    bodyStyleData.forEach((element) {
      ret.add(
        BodyStyle(
          id: element["id"],
          name: element["name"],
        ),
      );
    });

    return ret;
  }
}
