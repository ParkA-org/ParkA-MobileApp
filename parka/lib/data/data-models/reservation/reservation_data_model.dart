import 'dart:ffi';

import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/user/user_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';

class Reservation {
  final String id;
  final String rentalId;
  final String checkInDate;
  final String checkOutDate;
  final Vehicle vehicle;
  final String paymentInfoId;
  final String rentDate;
  final int total;
  final Parking parking;
  final String status;
  final User client;
  final User owner;

  Reservation({
    this.checkInDate,
    this.checkOutDate,
    this.id,
    this.paymentInfoId,
    this.rentDate,
    this.rentalId,
    this.status,
    this.total,
    this.client,
    this.owner,
    this.vehicle,
    this.parking,
  });

  static Reservation reservationFromJson(Map<String, dynamic> reservation) {
    return Reservation(
        id: reservation["id"],
        client: User.userFromJson(reservation["client"]),
        owner: User.userFromJson(reservation["owner"]),
        parking: Parking.parkingFromJsonPersonlized(reservation["parking"]),
        vehicle: Vehicle.vehiclefromJsonPersonalized(reservation["vehicle"]),
        checkInDate: reservation["checkInDate"],
        checkOutDate: reservation["checkOutDate"],
        status: reservation["status"],
        rentDate: reservation["rentDate"],
        total: reservation["total"]);
  }

  static List<Reservation> reservationsFromJson(List reservationData) {
    List<Reservation> userReservations = new List();

    reservationData.forEach((reservation) {
      userReservations.add(Reservation(
          id: reservation["id"],
          client: User.userFromJson(reservation["client"]),
          owner: User.userFromJson(reservation["owner"]),
          parking: Parking.parkingFromJsonPersonlized(reservation["parking"]),
          vehicle: Vehicle.vehiclefromJsonPersonalized(reservation["vehicle"]),
          checkInDate: reservation["checkInDate"],
          checkOutDate: reservation["checkOutDate"],
          status: reservation["status"],
          rentDate: reservation["rentDate"],
          total: reservation["total"]));
    });

    return userReservations;
  }
}
