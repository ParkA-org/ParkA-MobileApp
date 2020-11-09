import 'package:ParkA/data/data-models/position/position_data_model.dart';
import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';
import 'package:ParkA/data/dtos/parking/create_parking_dto.dart';
import 'package:get/state_manager.dart';

class CreateParkingFormController extends GetxController {
  RxInt step = 1.obs;
  Rx<CreateParkingDto> createPArkingDto = CreateParkingDto().obs;

  void increment() {
    step++;
  }

  void decrement() {
    step--;
  }

  void setParkingName(String _parkingName) {
    createPArkingDto.update((_instance) {
      _instance.parkingName = _parkingName;
    });
  }

  void setParkingCount(int number) {
    createPArkingDto.value.countParking = number;
  }

  void setParkingPrice(double _parkingPrice) {
    createPArkingDto.update((_instance) {
      _instance.priceHours = _parkingPrice;
    });
  }

  void setParkingDetails(String _parkingDetails) {
    createPArkingDto.update((_instance) {
      _instance.information = _parkingDetails;
    });
  }

  void setPosition(
    Position _position,
  ) {
    createPArkingDto.update((_instance) {
      _instance.lastitude = _position.latitude;
      _instance.longitude = _position.longitude;
      _instance.sector = _position.sector;
      _instance.direccion = _position.direction;
    });
  }

  void setMainPicture(String _imagePath) {
    createPArkingDto.update((_instance) {
      _instance.mainPicture = _imagePath;
    });
  }

  void addSecondaryPicture(String _imagePath) {
    createPArkingDto.update((_instance) {
      _instance.pictures.add(_imagePath);
    });
  }

  void removeSecondaryPicture(int _index) {
    createPArkingDto.update((_instance) {
      _instance.pictures.removeAt(_index);
    });
  }

  void addFeature(String _featureId) {
    createPArkingDto.update((_instance) {
      _instance.features.add(_featureId);
      print("add");
      print(_instance.features);
    });
  }

  void removeFeature(String _featureId) {
    createPArkingDto.update((_instance) {
      _instance.features.remove(_featureId);
      print(_instance.features);
    });
  }

  void addSchedule(String _weekDay, Schedule _schedule, int _index) {
    createPArkingDto.update((_instance) {
      print(_weekDay);
      print(_instance.calendar[_weekDay]);
      print("ADDING");
      if (_instance.calendar[_weekDay].length == _index) {
        _instance.calendar[_weekDay].add(_schedule);
      } else {
        _instance.calendar[_weekDay][_index] = _schedule;
      }
    });
  }

  void removeSchedule(String _weekDay, int _index) {
    createPArkingDto.update((_instance) {
      print(_weekDay);
      print(_instance.calendar[_weekDay]);
      print("REMOVING");
      _instance.calendar[_weekDay].removeAt(_index);
    });
  }
}
