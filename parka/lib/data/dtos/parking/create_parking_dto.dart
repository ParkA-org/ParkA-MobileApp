import 'package:ParkA/data/data-models/calendar/calendar_data_model.dart';
import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';

class CreateParkingDto {
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
}
