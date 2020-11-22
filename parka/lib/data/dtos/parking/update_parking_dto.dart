import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';
import 'package:flutter/cupertino.dart';

class UpdateParkingDto {
  final String parkingId;
  int countParking;
  String parkingName;
  double priceHours;
  List<String> pictures = [];
  String mainPicture;
  String sector;
  String direccion;
  String information;
  List<String> features = [];
  Map<String, List<Schedule>> calendar = {
    'friday': [],
    'monday': [],
    'saturday': [],
    'sunday': [],
    'thursday': [],
    'tuesday': [],
    'wednesday': [],
  };

  UpdateParkingDto({
    this.calendar,
    this.countParking,
    this.direccion,
    this.features,
    this.information,
    this.mainPicture,
    @required this.parkingId,
    this.parkingName,
    this.pictures,
    this.priceHours,
    this.sector,
  });
}
