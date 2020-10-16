class CreateVehicleDto {
  final String model;
  final String licensePlate;
  final String colorExterior;
  final String mainPicture;
  final List<String> pictures;
  final String year;
  final String alias;
  final String bodyStyle;

  CreateVehicleDto({
    this.model,
    this.licensePlate,
    this.alias,
    this.bodyStyle,
    this.colorExterior,
    this.mainPicture,
    this.pictures,
    this.year,
  });
}
