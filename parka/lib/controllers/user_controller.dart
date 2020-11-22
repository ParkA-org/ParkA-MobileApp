import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/user/user_data_model.dart';
import 'package:ParkA/data/dtos/login/user_login_dto.dart';
import 'package:ParkA/utils/prefs/shared_preferencies.dart';
import 'package:ParkA/data/use-cases/user/user_use_cases.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController {
  Rx<User> user = null.obs;

  void _init() async {
    String jwt = SharedPreferenciesUtil.storage.getString("jwt");

    if (jwt != null) {
      User _loggedUser = await UserUseCases.getLoggedUser();

      if (_loggedUser != null) {
        user.update((user) async {
          this.user = _loggedUser.obs;
        });
      }
    }
  }

  UserController() {
    this._init();
  }

  Future<bool> loginUser(String email, String password) async {
    UserLoginDto _userLoginDto = await UserUseCases.userLogin(email, password);

    User loggedUser = _userLoginDto.user;
    String _jwt = _userLoginDto.jwt;

    if (_userLoginDto != null) {
      SharedPreferenciesUtil.storage.setString("jwt", _jwt);

      user.update((user) async {
        this.user = loggedUser.obs;
      });
      return true;
    }

    return false;
  }

  Future updateUser(String name, String lastName) async {
    User updatedUser = await UserUseCases.updateUser(
      name: name,
      lastName: lastName,
    );

    if (updatedUser != null) {
      user.update((user) async {
        this.user = updatedUser.obs;
      });
      return true;
    }
    return false;
  }

  logout() async {
    await SharedPreferenciesUtil.storage.remove("jwt");
    print("REMOVED");
    user.update((user) {
      this.user = null.obs;
      Get.find<GraphqlClientController>().removeGraphqlClientJwt();
      print("Success");
    });
  }
}
