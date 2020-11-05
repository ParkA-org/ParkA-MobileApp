import 'package:ParkA/data/dtos/parking/create_parking_dto.dart';

bool createParkingFormValidator(CreateParkingDto createParkingDto) {
  if (createParkingDto.countParking == null) {
    return false;
  }

  if (createParkingDto.direccion == null) {
    return false;
  }

  if (createParkingDto.information == null) {
    return false;
  }

  if (createParkingDto.lastitude == null) {
    return false;
  }

  if (createParkingDto.longitude == null) {
    return false;
  }

  if (createParkingDto.mainPicture == null) {
    return false;
  }

  if (createParkingDto.parkingName == null) {
    return false;
  }

  if (createParkingDto.priceHours == null ||
      !(createParkingDto.priceHours is double)) {
    return false;
  }

  if (createParkingDto.sector == null) {
    return false;
  }

  return true;
}
