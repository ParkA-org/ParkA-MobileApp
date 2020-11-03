import 'package:ParkA/data/data-models/model/model_data_model.dart';

class Make {
  String id;
  String name;
  String icon;
  List<Model> models;

  Make({
    this.id,
    this.icon,
    this.models,
    this.name,
  });

  static makesFromJson(List makeData) {
    List<Make> ret = new List<Make>();

    makeData.forEach(
      (element) {
        ret.add(
          Make(
            id: element["id"],
            name: element["name"],
            models: Model.modelsFromJson(element['models']),
          ),
        );
      },
    );

    return ret;
  }
}
