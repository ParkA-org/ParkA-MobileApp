class Vehicle {
  final String id;
  final String model;
  final String licensePlate;
  final String detail;
  final String color;
  final String mainPicture;
  final List pictures;
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

  static vehiclesFromJason(List vehiclesData) {
    List<Vehicle> ret = new List();

    vehiclesData.forEach((vehicle) {
      ret.add(Vehicle(
        id: vehicle["id"],
        licensePlate: vehicle["licensePlate"],
        model: vehicle["model"]["name"],
        verified: vehicle["verified"],
        color: vehicle["colorExterior"]["name"],
        mainPicture: vehicle["mainPicture"],
        pictures: vehicle["pictures"],
        year: vehicle["year"],
        alias: vehicle["alias"],
        bodyStyle: vehicle["bodyStyle"]["name"],
        detail: vehicle["detail"],
      ));
    });

    return ret;
  }
}
