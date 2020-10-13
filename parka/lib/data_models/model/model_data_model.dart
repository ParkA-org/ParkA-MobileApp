class Model {
  String id;
  String make;
  String name;

  Model({
    this.id,
    this.make,
    this.name,
  });

  static modelsFromJson(List modelsData) {
    List<Model> ret = new List<Model>();

    modelsData.forEach((element) {
      ret.add(
        Model(
          id: element["id"],
          name: element["name"],
        ),
      );
    });

    return ret;
  }
}
