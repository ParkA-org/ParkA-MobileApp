import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';

class UpdateParkingDto {
  final String parkingId;
  int countParking;
  String lastitude;
  String longitude;
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
    this.lastitude,
    this.longitude,
    this.mainPicture,
    this.parkingId,
    this.parkingName,
    this.pictures,
    this.priceHours,
    this.sector,
  });
}
