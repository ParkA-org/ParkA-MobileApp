import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/data/dtos/reservation/create_reservation_dto.dart';
import 'package:ParkA/data/use-cases/reservation/reservation_use_cases.dart';
import 'package:get/get.dart';

class CreateReservationFormController extends GetxController {
  Rx<CreateReservationDto> _createReservationDto =
      new CreateReservationDto().obs;

  // checkInDate:"",
  // checkOutDate:"",
  // total:90,
  // rentDate:"",

  CreateReservationDto get createReservationDto =>
      this._createReservationDto.value;

  void setParkingData(Parking _parkingData) {
    _createReservationDto.update((_instance) {
      _instance.parking = _parkingData;
      _instance.owner = _parkingData.user;
    });
  }

  void setVehicle(Vehicle _vehicle) {
    _createReservationDto.update((_instance) {
      _instance.vehicle = _vehicle;
    });
  }

  void setPaymentInfo(Payment _payment) {
    _createReservationDto.update((_instance) {
      _instance.paymentInfo = _payment;
    });
  }

  void setReservationDate(DateTime _datetime) {
    _createReservationDto.update((_instance) {
      _instance.rentDate = _datetime;
    });
  }

  Future<bool> createReservation() async {
    final result = await ReservationUseCases.createReservation(
        this._createReservationDto.value);

    return result;
  }
}
