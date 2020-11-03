import 'package:ParkA/data/dtos/parking/create_parking_dto.dart';
import 'package:get/state_manager.dart';

class CreateParkingFormController extends GetxController {
  RxInt step = 1.obs;
  Rx<CreateParkingDto> createPArkingDto = CreateParkingDto().obs;

  void increment() {
    step.value++;
  }

  void decrement() {
    step.value--;
  }

  void setParkingCount(int number) {
    createPArkingDto.value.countParking = number;
  }

  void setPosition() {}
}
