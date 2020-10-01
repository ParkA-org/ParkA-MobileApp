import 'package:ParkA/data_models/user/user_data_model.dart';
import 'package:ParkA/use-cases/user/user_use_cases.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController {
  Rx<User> user = User().obs;

  loginUser(String email, String password) async {
    user.update((user) async {
      User loggedUser = await UserUseCases.userLogin(email, password);

      user.name = loggedUser.name;
      user.lastName = loggedUser.lastName;
      user.email = loggedUser.email;
    });
  }
}
