import 'package:ParkA/data/data-models/make/make_data_model.dart';

class Model {
  String id;
  Make make;
  String name;

  Model({
    this.id,
    this.make,
    this.name,
  });

  static modelFromJson(Map<String, dynamic> modelData) {
    return Model(
      id: modelData["id"],
      make: Make.makeFromJson(modelData["make"]),
      name: modelData["name"],
    );
  }

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
