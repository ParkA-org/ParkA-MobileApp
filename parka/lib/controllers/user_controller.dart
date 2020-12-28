import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/controllers/login/google_sign_in.dart';
import 'package:ParkA/data/data-models/user/user_data_model.dart';
import 'package:ParkA/data/dtos/login/login_result_dto.dart';
import 'package:ParkA/data/dtos/login/social_login_dto.dart';
import 'package:ParkA/data/dtos/login/user_login_dto.dart';
import 'package:ParkA/utils/prefs/shared_preferencies.dart';
import 'package:ParkA/data/use-cases/user/user_use_cases.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

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

  Future<void> socialLoginUser(SocialLoginResult _loginResult) async {
    //Get the User and JWT from the Previous Social Login attempt
    User loggedUser = _loginResult.user;
    String _jwt = _loginResult.jwt;

    SharedPreferenciesUtil.storage.setString("jwt", _jwt);

    SharedPreferenciesUtil.storage.setString("origin", _loginResult.origin);

    user.update((user) {
      this.user = loggedUser.obs;
    });
  }

  Future<LoginResult> loginUser(String email, String password) async {
    UserLoginDto _userLoginDto = await UserUseCases.userLogin(email, password);

    if (_userLoginDto.status != null && !_userLoginDto.status) {
      return LoginResult(status: false, message: _userLoginDto.message);
    }

    User loggedUser = _userLoginDto.user;
    String _jwt = _userLoginDto.jwt;

    if (_userLoginDto != null) {
      SharedPreferenciesUtil.storage.setString("jwt", _jwt);

      SharedPreferenciesUtil.storage.setString("origin", "email");

      user.update((user) {
        this.user = loggedUser.obs;
      });
      return LoginResult(status: true);
    }

    return LoginResult(status: false);
  }

  Future updateUser(String name, String lastName, String userPicture) async {
    User updatedUser = await UserUseCases.updateUser(
      name: name,
      lastName: lastName,
      profilePicture: userPicture,
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
    if (SharedPreferenciesUtil.storage.getString("origin") == "google") {
      try {
        await Get.find<GoogleSignInController>().googleSignIn.signOut();
      } catch (ex) {
        await Get.put(GoogleSignInController()).googleSignIn.signOut();
      }
    }
    await SharedPreferenciesUtil.storage.remove("jwt");
    await SharedPreferenciesUtil.storage.remove("origin");
    print("REMOVED");
    user.update((user) {
      this.user = null.obs;
      Get.find<GraphqlClientController>().removeGraphqlClientJwt();
      print("Success");
    });
  }
}
