import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/user/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ParkA/data/use-cases/user/user_use_cases.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController {
  SharedPreferences _sharedPreferencies;
  Rx<User> user = null.obs;

  void _initSharedPreferencies() async {
    print("INIT SHARED PREFS");
    this._sharedPreferencies = await SharedPreferences.getInstance();
    String jwt = this._sharedPreferencies.getString("jwt");

    if (jwt == null) {
      print("NOT FOUND");
    }
  }

  UserController() {
    this._initSharedPreferencies();
  }

  Future<bool> loginUser(String email, String password) async {
    User loggedUser = await UserUseCases.userLogin(email, password);

    if (loggedUser != null) {
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
    user.update((user) {
      this.user = null.obs;
      Get.find<GraphqlClientController>().removeGraphqlClientJwt();
      print("Success");
    });
  }
}
