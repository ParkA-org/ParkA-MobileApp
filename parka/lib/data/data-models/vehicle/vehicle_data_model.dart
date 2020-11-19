import 'package:ParkA/data/data-models/model/model_data_model.dart';

class Vehicle {
  final String id;
  final Model model;
  final String licensePlate;
  final String detail;
  final String color;
  final String mainPicture;
  final List<String> pictures;
  final int year;
  final String alias;
  final bodyStyle;
  final bool verified;

  Vehicle({
    this.id,
    this.model,
    this.licensePlate,
    this.detail,
    this.color,
    this.mainPicture,
    this.pictures,
    this.year,
    this.alias,
    this.bodyStyle,
    this.verified,
  });

  static vehiclefromJson(Map<String, dynamic> vehicleData) {
    List<String> carPictures = new List();

    vehicleData["pictures"].forEach((element) {
      carPictures.add(element);
    });

    return Vehicle(
      id: vehicleData["id"],
      licensePlate: vehicleData["licensePlate"],
      model: Model.modelFromJson(vehicleData["model"]),
      verified: vehicleData["verified"],
      color: vehicleData["colorExterior"]["name"],
      mainPicture: vehicleData["mainPicture"],
      pictures: carPictures,
      year: vehicleData["year"],
      alias: vehicleData["alias"],
      bodyStyle: vehicleData["bodyStyle"]["name"],
      detail: vehicleData["detail"],
    );
  }

  static vehiclesFromJason(List vehiclesData) {
    List<Vehicle> ret = new List();

    vehiclesData.forEach((vehicle) {
      List<String> carPictures = new List();

      vehicle["pictures"].forEach((element) {
        carPictures.add(element);
      });

      ret.add(Vehicle(
        id: vehicle["id"],
        licensePlate: vehicle["licensePlate"],
        model: Model.modelFromJson(vehicle["model"]),
        verified: vehicle["verified"],
        color: vehicle["colorExterior"]["name"],
        mainPicture: vehicle["mainPicture"],
        pictures: carPictures,
        year: vehicle["year"],
        alias: vehicle["alias"],
        bodyStyle: vehicle["bodyStyle"]["name"],
        detail: vehicle["detail"],
      ));
    });

    return ret;
  }
}
