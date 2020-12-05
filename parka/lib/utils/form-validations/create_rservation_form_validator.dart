import 'package:ParkA/data/dtos/reservation/create_reservation_dto.dart';

bool createReservationFormValidator(
    CreateReservationDto _createReservationDto) {
  if (_createReservationDto.parking == null) {
    return false;
  }

  if (_createReservationDto.checkInDate == null) {
    return false;
  }

  if (_createReservationDto.checkOutDate == null) {
    return false;
  }

  if (_createReservationDto.vehicle == null) {
    return false;
  }

  if (_createReservationDto.paymentInfo == null) {
    return false;
  }

  if (_createReservationDto.total == null) {
    return false;
  }

  if (_createReservationDto.rentDate == null) {
    return false;
  }

  return true;
}
