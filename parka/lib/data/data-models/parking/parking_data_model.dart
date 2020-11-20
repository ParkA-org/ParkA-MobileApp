import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';

class Parking {
  final String id;
  final int parkingCount;
  final String parkingName;
  final String latitude;
  final String longitude;
  final String calendar;
  final double perHourPrice;
  final String mainPicture;
  final List<String> pictures;
  final bool status;
  final String sector;
  final String direction;
  final String information;
  final List<Feature> features;
  final bool verified;

  Parking({
    this.parkingName,
    this.id,
    this.direction,
    this.features,
    this.information,
    this.latitude,
    this.longitude,
    this.calendar,
    this.mainPicture,
    this.parkingCount,
    this.perHourPrice,
    this.pictures,
    this.sector,
    this.status,
    this.verified,
  });

  static parkingsFromJson(List parkingData) {
    List<Parking> userParkings = new List();

    parkingData.forEach((parking) {
      userParkings.add(Parking(
          id: parking["id"],
          parkingCount: parking["countParking"],
          latitude: parking["latitude"],
          longitude: parking["longitude"],
          parkingName: parking["parkingName"]));
    });
  }
}
