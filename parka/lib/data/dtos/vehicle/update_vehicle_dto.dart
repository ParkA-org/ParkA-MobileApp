import 'package:flutter/cupertino.dart';

class UpdateVehicleDto {
  final id;
  String model;
  String licensePlate;
  String colorExterior;
  String mainPicture;
  List<String> pictures;
  String year;
  String alias;
  String bodyStyle;
  String detail;

  UpdateVehicleDto({
    @required this.id,
    this.model,
    this.licensePlate,
    this.alias,
    this.bodyStyle,
    this.colorExterior,
    this.mainPicture,
    this.pictures,
    this.year,
    this.detail,
  });
}
