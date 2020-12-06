import 'package:ParkA/controllers/register-user-form/register_user_controller.dart';
import 'package:get/get.dart';

class RegistrationFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterUSerController>(() => RegisterUSerController());
  }
}
