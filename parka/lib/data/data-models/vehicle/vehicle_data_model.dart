import 'package:ParkA/data/data-models/body-style/body_style_data_model.dart';
import 'package:ParkA/data/data-models/color/color_data_model.dart';
import 'package:ParkA/data/data-models/model/model_data_model.dart';

class Vehicle {
  final String id;
  final Model model;
  final String licensePlate;
  final String detail;
  final Color color;
  final String mainPicture;
  final List<String> pictures;
  final int year;
  final String alias;
  final BodyStyle bodyStyle;
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
      color: Color.colorFromJson(
        vehicleData["colorExterior"],
      ),
      mainPicture: vehicleData["mainPicture"],
      pictures: carPictures,
      year: vehicleData["year"],
      alias: vehicleData["alias"],
      bodyStyle: BodyStyle.bodyStyleFromJson(vehicleData["bodyStyle"]),
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
        color: Color.colorFromJson(vehicle["colorExterior"]),
        mainPicture: vehicle["mainPicture"],
        pictures: carPictures,
        year: vehicle["year"],
        alias: vehicle["alias"],
        bodyStyle: BodyStyle.bodyStyleFromJson(vehicle["bodyStyle"]),
        detail: vehicle["detail"],
      ));
    });

    return ret;
  }
}
