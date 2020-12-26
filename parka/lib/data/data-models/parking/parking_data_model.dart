import 'package:ParkA/data/data-models/calendar/calendar_data_model.dart';
import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';
import 'package:ParkA/data/data-models/user/user_data_model.dart';

class Parking {
  final String id;
  final int parkingCount;
  final String parkingName;
  final double latitude;
  final double longitude;
  final Calendar calendar;
  final double priceHours;
  final String mainPicture;
  final List pictures;
  final bool status;
  final String sector;
  final String direction;
  final String information;
  final List<Feature> features;
  final bool verified;
  final double rating;
  final User user;
  final bool isAvailable;

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
    this.priceHours,
    this.pictures,
    this.sector,
    this.status,
    this.verified,
    this.user,
    this.isAvailable,
  });

  static Parking parkingFromJson(Map<String, dynamic> parking) {
    List<String> _pictures = new List.from(parking["pictures"]);

    return Parking(
      id: parking["id"],
      parkingCount: int.tryParse(parking["countParking"].toString()),
      latitude: parking["latitude"],
      longitude: parking["longitude"],
      parkingName: parking["parkingName"],
      mainPicture: parking["mainPicture"],
      pictures: _pictures,
      calendar: Calendar.calendarFromJson(parking["calendar"]),
      features: Feature.featuresFromJson(parking["features"]),
      priceHours: double.tryParse(parking["priceHours"].toString()),
      rating: double.tryParse(
        parking["rating"].toString(),
      ),
      information: parking["information"],
      user: User.otherUserFromJson(parking['user']),
      isAvailable: parking["isAvailable"],
    );
  }

  static parkingsFromJson(List parkingData) {
    List<Parking> userParkings = new List();

    parkingData.forEach((parking) {
      List<Feature> _features = new List.from(parking["features"] != null
          ? Feature.featuresFromJson(parking["features"])
          : []);
      List<String> _pictures = new List.from(parking["pictures"] ?? []);
      userParkings.add(
        Parking(
          id: parking["id"],
          parkingCount: int.tryParse(parking["countParking"].toString()),
          latitude: parking["latitude"],
          longitude: parking["longitude"],
          parkingName: parking["parkingName"],
          mainPicture: parking["mainPicture"],
          features: _features,
          pictures: _pictures,
          user: User.userFromJson(parking["user"]),
          priceHours: double.tryParse(parking["priceHours"].toString()),
          rating: double.tryParse(
            parking["rating"].toString(),
          ),
          isAvailable: parking["isAvailable"],
          direction: parking["direction"],
          information: parking["information"],
        ),
      );
    });

    return userParkings;
  }

  static Parking parkingFromJsonPersonlized(Map<String, dynamic> parking) {
    List<String> _pictures = new List.from(parking["pictures"]);

    return Parking(
      id: parking["id"],
      parkingName: parking["parkingName"],
      mainPicture: parking["mainPicture"],
      pictures: _pictures,
      priceHours: double.tryParse(parking["priceHours"].toString()),
      rating: double.tryParse(
        parking["rating"].toString(),
      ),
    );
  }
}
