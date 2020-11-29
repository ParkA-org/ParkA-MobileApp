import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';

class UpdateParkingDto {
  final String parkingId;
  int countParking;
  String parkingName;
  double priceHours;
  List<String> pictures = [];
  String mainPicture;
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
    this.features,
    this.information,
    this.mainPicture,
    this.parkingId,
    this.parkingName,
    this.pictures,
    this.priceHours,
  });
}
