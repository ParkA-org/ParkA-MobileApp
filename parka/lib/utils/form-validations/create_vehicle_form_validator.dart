import 'package:ParkA/data/data-models/vehicle/dto/create_vehicle_dto.dart';

bool createVehicleFormValidator(CreateVehicleDto createVehicleDto) {
  if (createVehicleDto.licensePlate == null ||
      createVehicleDto.licensePlate.length != 7) {
    return false;
  }

  if (createVehicleDto.detail == null) {
    return false;
  }

  if (createVehicleDto.alias == null) {
    return false;
  }

  if (createVehicleDto.bodyStyle == null) {
    return false;
  }

  if (createVehicleDto.colorExterior == null) {
    return false;
  }

  if (createVehicleDto.mainPicture == null) {
    return false;
  }

  if (createVehicleDto.model == null) {
    return false;
  }

  if (createVehicleDto.year == null) {
    return false;
  }

  return true;
}
