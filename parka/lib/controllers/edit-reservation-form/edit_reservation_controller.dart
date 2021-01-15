import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/data/dtos/reservation/edit_reservation_dto.dart';
import 'package:ParkA/data/use-cases/reservation/reservation_use_cases.dart';
import 'package:get/get.dart';

class EditReservationFormController extends GetxController {
  Rx<EditReservationDto> _editReservationDto = new EditReservationDto().obs;

  EditReservationDto get editReservationDto => this._editReservationDto.value;

  void initReservation(Reservation _reservation) {
    print(_reservation.vehicle.model.name);

    _editReservationDto.update((_instance) {
      _instance.reservationId = _reservation.id;
      _instance.checkInDate = _reservation.checkInDate;
      _instance.checkOutDate = _reservation.checkOutDate;
      _instance.owner = _reservation.owner;
      _instance.parking = _reservation.parking;
      _instance.paymentInfo = _reservation.paymentInfo;
      _instance.rentDate = DateTime.tryParse(_reservation.rentDate);
      _instance.total = _reservation.total;
      _instance.vehicle = _reservation.vehicle;
      _instance.hours =
          _getTotalTime(_reservation.checkInDate, _reservation.checkOutDate);
    });
  }

  void setParkingData(Parking _parkingData) {
    _editReservationDto.update((_instance) {
      _instance.parking = _parkingData;
      _instance.owner = _parkingData.user;
    });
  }

  void setVehicle(Vehicle _vehicle) {
    _editReservationDto.update((_instance) {
      _instance.vehicle = _vehicle;
    });
  }

  void setPaymentInfo(Payment _payment) {
    _editReservationDto.update((_instance) {
      _instance.paymentInfo = _payment;
    });
  }

  void setReservationDate(DateTime _datetime) {
    _editReservationDto.update((_instance) {
      _instance.rentDate = _datetime;
      _instance.checkInDate = null;
      _instance.checkOutDate = null;
      _instance.total = 0;
      _instance.hours = 0;
    });
  }

  String _generateISOStringFromTime(String _time, DateTime _datetime) {
    List<String> _splittedTime = _time.split(":");
    int _hour = int.tryParse(_splittedTime[0]);
    int _minute = int.tryParse(_splittedTime[1]);

    String _isoDate = new DateTime(
            _datetime.year, _datetime.month, _datetime.day, _hour, _minute)
        .toIso8601String();

    return _isoDate;
  }

  void setStartTime(String _startTime, {String finishTime}) {
    _editReservationDto.update((_instance) {
      _instance.checkInDate = _generateISOStringFromTime(
        _startTime,
        this.editReservationDto.rentDate,
      );

      if (finishTime != null) {
        finishTime = finishTime == "24:00" ? "23:59" : finishTime;
        _instance.checkOutDate = _generateISOStringFromTime(
          finishTime,
          this.editReservationDto.rentDate,
        );
      }
      this.editReservationDto.hours = _getTotalTime(
          this.editReservationDto.checkInDate,
          this.editReservationDto.checkOutDate);
      this.editReservationDto.total =
          this.editReservationDto.parking.priceHours *
              this.editReservationDto.hours;
    });
  }

  void setFinishTime(String _finishTime, {String startTime}) {
    _editReservationDto.update((_instance) {
      _instance.checkOutDate = _generateISOStringFromTime(
        _finishTime,
        this.editReservationDto.rentDate,
      );
      if (startTime != null) {
        _instance.checkInDate = _generateISOStringFromTime(
          startTime,
          this.editReservationDto.rentDate,
        );
      }
      this.editReservationDto.hours = _getTotalTime(
          this.editReservationDto.checkInDate,
          this.editReservationDto.checkOutDate);
      this.editReservationDto.total =
          this.editReservationDto.parking.priceHours *
              this.editReservationDto.hours;
    });
  }

  double _getTotalTime(String _start, String _finish) {
    DateTime start = DateTime.parse(_start);
    DateTime finish = DateTime.parse(_finish);

    int _diffInSeconds = start.difference(finish).inSeconds.abs();

    double hours = (_diffInSeconds / 3600).toPrecision(1);

    return hours;
  }

  Future<bool> editReservation() async {
    final result = await ReservationUseCases.editReservation(
        this._editReservationDto.value);

    return result;
  }
}
