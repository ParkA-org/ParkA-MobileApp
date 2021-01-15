import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/data/data-models/user/user_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';

class EditReservationDto {
  String reservationId;
  Parking parking;
  User owner;
  String checkInDate;
  String checkOutDate;
  Vehicle vehicle;
  Payment paymentInfo;
  double total;
  DateTime rentDate;
  double hours;

  EditReservationDto({
    this.reservationId,
    this.parking,
    this.checkInDate,
    this.checkOutDate,
    this.hours,
    this.owner,
    this.paymentInfo,
    this.rentDate,
    this.total,
    this.vehicle,
  });
}
