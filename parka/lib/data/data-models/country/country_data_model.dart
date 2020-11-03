class Country {
  String id;
  String name;

  Country({
    this.id,
    this.name,
  });

  static countriesFromJson(List countriesData) {
    List<Country> ret = new List<Country>();

    for (var nationality in countriesData) {
      ret.add(Country(
        id: nationality["id"],
        name: nationality["name"],
      ));
    }

    return ret;
  }
}
