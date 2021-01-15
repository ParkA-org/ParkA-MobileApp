import 'package:ParkA/data/dtos/reservation/edit_reservation_dto.dart';

bool editReservationFormValidator(EditReservationDto _editReservationDto) {
  if (_editReservationDto.parking == null) {
    return false;
  }

  if (_editReservationDto.checkInDate == null) {
    return false;
  }

  if (_editReservationDto.checkOutDate == null) {
    return false;
  }

  if (_editReservationDto.vehicle == null) {
    return false;
  }

  if (_editReservationDto.paymentInfo == null) {
    return false;
  }

  if (_editReservationDto.total == null) {
    return false;
  }

  if (_editReservationDto.rentDate == null) {
    return false;
  }

  return true;
}
