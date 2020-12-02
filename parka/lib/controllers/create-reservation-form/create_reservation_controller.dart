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

  String _generateISOStringFromTime(String _time, DateTime _datetime) {
    print(_time);

    List<String> _splittedTime = _time.split(":");
    int _hour = int.tryParse(_splittedTime[0]);
    int _minute = int.tryParse(_splittedTime[1]);

    String _isoDate = new DateTime(
            _datetime.year, _datetime.month, _datetime.day, _hour, _minute)
        .toIso8601String();

    return _isoDate;
  }

  void setStartTime(String _startTime, {String finishTime}) {
    _createReservationDto.update((_instance) {
      _instance.checkInDate = _generateISOStringFromTime(
        _startTime,
        this.createReservationDto.rentDate,
      );

      if (finishTime != null) {
        finishTime = finishTime == "24:00" ? "23:59" : finishTime;
        _instance.checkOutDate = _generateISOStringFromTime(
          finishTime,
          this.createReservationDto.rentDate,
        );
      }
    });
  }

  void setFinishTime(String _finishTime, {String startTime}) {
    _createReservationDto.update((_instance) {
      _instance.checkOutDate = _generateISOStringFromTime(
        _finishTime,
        this.createReservationDto.rentDate,
      );
      if (startTime != null) {
        _instance.checkInDate = _generateISOStringFromTime(
          startTime,
          this.createReservationDto.rentDate,
        );
      }
    });
  }

  Future<bool> createReservation() async {
    final result = await ReservationUseCases.createReservation(
        this._createReservationDto.value);

    return result;
  }
}
