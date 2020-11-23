class Feature {
  String id;
  String name;

  Feature({
    this.id,
    this.name,
  });

  static featuresFromJson(List featuresData) {
    List<Feature> ret = new List<Feature>();

    featuresData.forEach((element) {
      ret.add(
        Feature(
          id: element["id"],
          name: element["name"],
        ),
      );
    });

    return ret;
  }
}
