import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  RxString _userPassword = "".obs;

  String get password => this._userPassword.value;

  void setPassword(String _password) {
    this._userPassword.update((val) {
      this._userPassword.value = _password;
    });
  }
}
