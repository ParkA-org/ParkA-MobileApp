class Nationality {
  String id;
  String name;

  Nationality({
    this.id,
    this.name,
  });

  static nationalitiesFromJson(List nationalitiesData) {
    List<Nationality> ret = new List<Nationality>();

    for (var nationality in nationalitiesData) {
      ret.add(Nationality(
        id: nationality["id"],
        name: nationality["name"],
      ));
    }

    return ret;
  }
}
