import 'package:ParkA/controllers/user_controller.dart';
import 'package:ParkA/data/dtos/login/social_login_dto.dart';
import 'package:ParkA/data/use-cases/user/user_use_cases.dart';
import 'package:ParkA/pages/map/maps_page.dart';
import 'package:ParkA/pages/register/steps/user_information_page.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleSignInController extends GetxController {
  GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ["https://www.googleapis.com/auth/user.phonenumbers.read"]);

  void signIn() async {
    GoogleSignInAccount googleAccount = await googleSignIn.signIn();

    SocialLoginResult loginResult = await UserUseCases.socialLogin(
        googleAccount.email,
        googleAccount.displayName,
        googleAccount.photoUrl,
        "google");

    if (loginResult != null && loginResult.userIsRegistered) {
      Get.find<UserController>().socialLoginUser(loginResult);
      Get.toNamed(MapPage.routeName);
    } else {
      final authHeaders = await googleSignIn.currentUser.authHeaders;
      await getContactInfo(authHeaders, googleAccount.id);
      Get.toNamed(UserInformationPage.routeName);
    }
  }

  Future<String> getContactInfo(authHeader, accountId) async {
    String url =
        "https://people.googleapis.com/v1/people/$accountId?personFields=phoneNumbers";

    var response = await http.get(url, headers: authHeader);

    print(response.body);
    return "Yes";
  }
}
