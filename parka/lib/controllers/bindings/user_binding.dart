import 'package:ParkA/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
