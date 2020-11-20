import 'dart:ffi';

import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';

class Parking {
  final String id;
  final int parkingCount;
  final String parkingName;
  final double latitude;
  final double longitude;
  final String calendar;
  final double perHourPrice;
  final String mainPicture;
  final List pictures;
  final bool status;
  final String sector;
  final String direction;
  final String information;
  final List<Feature> features;
  final bool verified;
  final double rating;

  Parking({
    this.rating,
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
          parkingCount: int.parse(parking["countParking"].toString()),
          latitude: double.parse(parking["latitude"]),
          longitude: double.parse(parking["longitude"]),
          parkingName: parking["parkingName"],
          mainPicture: parking["mainPicture"],
          pictures: parking["pictures"],
          perHourPrice: double.parse(parking["priceHours"]),
          rating: parking["rating"].toDouble()));
    });

    return userParkings;
  }
}
