import 'package:ParkA/data/dtos/vehicle/update_vehicle_dto.dart';

bool updateVehicleFormValidator(UpdateVehicleDto _updateVehicleDto) {
  if (_updateVehicleDto.licensePlate == null ||
      _updateVehicleDto.licensePlate.length != 7) {
    return false;
  }

  if (_updateVehicleDto.alias == null) {
    return false;
  }

  if (_updateVehicleDto.detail == null) {
    return false;
  }

  if (_updateVehicleDto.bodyStyle == null) {
    return false;
  }

  if (_updateVehicleDto.colorExterior == null) {
    return false;
  }

  if (_updateVehicleDto.mainPicture == null) {
    return false;
  }

  if (_updateVehicleDto.model == null) {
    return false;
  }

  if (_updateVehicleDto.year == null) {
    return false;
  }

  return true;
}
