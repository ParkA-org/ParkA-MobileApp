class ParkingFilterDto {
  double rating;
  double minPrice;
  double maxPrice;
  List<String> features;
  String parkingName;
  bool isAvaliable;

  ParkingFilterDto({
    this.features,
    this.isAvaliable,
    this.maxPrice,
    this.minPrice,
    this.parkingName,
    this.rating,
  }) {
    this.rating = this.rating ?? 5;
    this.features = this.features ?? [];
  }
}
