import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingFilterDto {
  double rating;
  double minPrice;
  double maxPrice;
  List<String> features;
  String parkingName;
  LatLng position;
  bool isAvaliable;

  ParkingFilterDto({
    this.features,
    this.isAvaliable,
    this.maxPrice,
    this.minPrice,
    this.parkingName,
    this.rating,
    this.position,
  }) {
    this.features = this.features ?? [];
  }
}
