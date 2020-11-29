import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';

class CreateReservationDto {
  String parking;
  String owner;
  String checkInDate;
  String checkOutDate;
  Vehicle vehicle;
  Payment paymentInfo;
  double total;
  String rentDate;
}
