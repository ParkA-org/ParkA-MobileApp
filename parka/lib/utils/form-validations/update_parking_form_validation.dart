import 'package:ParkA/data/dtos/parking/update_parking_dto.dart';

bool updateParkingFormValidator(UpdateParkingDto _updateParkingDto) {
  if (_updateParkingDto.parkingName == null ||
      _updateParkingDto.parkingName.isEmpty) {
    return false;
  }

  if (_updateParkingDto.countParking == null ||
      _updateParkingDto.countParking == 0) {
    return false;
  }

  if (_updateParkingDto.priceHours == null ||
      _updateParkingDto.priceHours == 0) {
    return false;
  }

  return true;
}
