import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';
import 'package:ParkA/data/dtos/parking/update_parking_dto.dart';
import 'package:get/state_manager.dart';

class UpdateParkingFormController extends GetxController {
  RxInt step = 1.obs;
  Rx<UpdateParkingDto> _updateParkingDto = new UpdateParkingDto().obs;

  void initParkingDto(Parking parking) {
    Map<String, List<Schedule>> _calendar = {
      'friday': parking.calendar.friday,
      'monday': parking.calendar.monday,
      'saturday': parking.calendar.saturday,
      'sunday': parking.calendar.sunday,
      'thursday': parking.calendar.thursday,
      'tuesday': parking.calendar.tuesday,
      'wednesday': parking.calendar.wednesday,
    };

    print(parking.information);

    this._updateParkingDto = UpdateParkingDto(
      parkingId: parking.id,
      calendar: _calendar,
      countParking: parking.parkingCount,
      features: new List.from(parking.features.map((e) => e.id)),
      information: parking.information,
      mainPicture: parking.mainPicture,
      parkingName: parking.parkingName,
      pictures: parking.pictures,
      priceHours: parking.perHourPrice,
    ).obs;
  }

  UpdateParkingDto get updateParkingDto => this._updateParkingDto.value;

  void increment() {
    step++;
  }

  void decrement() {
    step--;
  }

  void setParkingName(String _parkingName) {
    _updateParkingDto.update((_instance) {
      _instance.parkingName = _parkingName;
    });
  }

  void setParkingCount(int number) {
    _updateParkingDto.value.countParking = number;
  }

  void setParkingPrice(double _parkingPrice) {
    _updateParkingDto.update((_instance) {
      _instance.priceHours = _parkingPrice;
    });
  }

  void setParkingDetails(String _parkingDetails) {
    _updateParkingDto.update((_instance) {
      _instance.information = _parkingDetails;
    });
  }

  void setMainPicture(String _imagePath) {
    _updateParkingDto.update((_instance) {
      _instance.mainPicture = _imagePath;
    });
  }

  void addSecondaryPicture(String _imagePath) {
    _updateParkingDto.update((_instance) {
      _instance.pictures.add(_imagePath);
    });
  }

  void removeSecondaryPicture(int _index) {
    _updateParkingDto.update((_instance) {
      _instance.pictures.removeAt(_index);
    });
  }

  void addFeature(String _featureId) {
    _updateParkingDto.update((_instance) {
      _instance.features.add(_featureId);
      print("add");
      print(_instance.features);
    });
  }

  void removeFeature(String _featureId) {
    _updateParkingDto.update((_instance) {
      _instance.features.remove(_featureId);
      print(_instance.features);
    });
  }

  void addSchedule(String _weekDay, Schedule _schedule, int _index) {
    _updateParkingDto.update((_instance) {
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
    _updateParkingDto.update((_instance) {
      print(_weekDay);
      print(_instance.calendar[_weekDay]);
      print("REMOVING");
      _instance.calendar[_weekDay].removeAt(_index);
      if (_instance.calendar[_weekDay].length == 1) {
        if (_instance.calendar[_weekDay][0] == null) {
          _instance.calendar[_weekDay].clear();
        }
      }
    });
  }

  void set24hSchedule(String _weekDay) {
    _updateParkingDto.update((_instance) {
      Schedule _schedule = new Schedule(
        finish: 2400,
        start: 0,
        is24h: true,
      );
      _instance.calendar[_weekDay].clear();

      _instance.calendar[_weekDay].add(_schedule);
    });
  }

  void clearSchedule(String _weekDay) {
    _updateParkingDto.update((_instance) {
      _instance.calendar[_weekDay].clear();
    });
  }
}
