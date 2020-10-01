import 'package:ParkA/controllers/user_controller.dart';
import 'package:get/state_manager.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
