class Vehicle {
  final String vehicleId;
  final String modelId;
  final String licensePlate;
  final String detail;
  final String colorExteriorId;
  final String mainPicture;
  final List<String> pictures;
  final int year;
  final String alias;
  final vehicleTypeId;

  Vehicle({
    this.vehicleId,
    this.modelId,
    this.licensePlate,
    this.detail,
    this.colorExteriorId,
    this.mainPicture,
    this.pictures,
    this.year,
    this.alias,
    this.vehicleTypeId,
  });
}
