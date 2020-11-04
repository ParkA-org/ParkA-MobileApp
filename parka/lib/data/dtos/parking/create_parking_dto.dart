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
  List<String> features;
  Map calendar = {
    'monday': [],
    'tuesday': [],
    'wednesday': [],
    'thursday': [],
    'friday': [],
    'saturday': [],
    'sunday': [],
  };
}
