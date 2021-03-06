import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/data/data-models/user/user_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';

class Reservation {
  final String id;
  final String rentalId;
  final String checkInDate;
  final String checkOutDate;
  final Vehicle vehicle;
  final Payment paymentInfo;
  final String rentDate;
  final double total;
  final Parking parking;
  final String status;
  final User client;
  final User owner;
  final bool reviewed;

  Reservation({
    this.checkInDate,
    this.checkOutDate,
    this.id,
    this.paymentInfo,
    this.rentDate,
    this.rentalId,
    this.status,
    this.total,
    this.client,
    this.owner,
    this.vehicle,
    this.parking,
    this.reviewed,
  });

  static Reservation reservationFromJson(Map<String, dynamic> reservation) {
    return Reservation(
      id: reservation["id"],
      client: User.otherUserFromJson(reservation["client"]),
      owner: User.otherUserFromJson(reservation["owner"]),
      parking: Parking.parkingFromJsonPersonlized(reservation["parking"]),
      vehicle: Vehicle.vehiclefromJsonPersonalized(reservation["vehicle"]),
      checkInDate: reservation["checkInDate"],
      checkOutDate: reservation["checkOutDate"],
      status: reservation["status"],
      rentDate: reservation["rentDate"],
      total: double.parse(reservation["total"].toString()),
      reviewed: reservation["reviewed"],
      paymentInfo: Payment.paymentFromJson(reservation['paymentInfo']),
    );
  }

  static List<Reservation> reservationsFromJson(List reservationData) {
    List<Reservation> userReservations = new List();

    reservationData.forEach((reservation) {
      userReservations.add(Reservation(
          id: reservation["id"],
          client: User.otherUserFromJson(reservation["client"]),
          owner: User.otherUserFromJson(reservation["owner"]),
          parking: Parking.parkingFromJsonPersonlized(reservation["parking"]),
          vehicle: Vehicle.vehiclefromJsonPersonalized(reservation["vehicle"]),
          checkInDate: reservation["checkInDate"],
          checkOutDate: reservation["checkOutDate"],
          status: reservation["status"],
          rentDate: reservation["rentDate"],
          total: double.parse(reservation["total"].toString()),
          reviewed: reservation["reviewed"]));
    });

    return userReservations;
  }
}
