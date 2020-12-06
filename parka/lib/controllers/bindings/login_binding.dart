import 'package:ParkA/controllers/login/login_controller.dart';
import 'package:get/state_manager.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
