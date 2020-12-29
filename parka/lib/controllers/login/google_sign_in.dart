import 'package:ParkA/controllers/bindings/registration_controller_binding.dart';
import 'package:ParkA/controllers/register-user-form/register_user_controller.dart';
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
      //Permission for user creation in case user is not registered
      scopes: ["https://www.googleapis.com/auth/user.phonenumbers.read"]);

  void signIn() async {
    GoogleSignInAccount googleAccount = await googleSignIn.signIn();

    SocialLoginResult loginResult = await UserUseCases.socialLogin(
        googleAccount.email,
        googleAccount.displayName,
        googleAccount.photoUrl,
        "google");

    if (loginResult != null && loginResult.userIsRegistered) {
      //Login attempt is not null and User is previously registered
      loginUserWithGoogle(loginResult);
    } else {
      //Login Attempt was succesful but user is not Registered
      registerUserWithGoogle(googleAccount);
    }
  }

  void registerUserWithGoogle(GoogleSignInAccount currentUser) async {
    //Create different Page to use a differente Binding
    GetPage(
        name: UserInformationPage.routeName + "WithGoogle",
        page: () => UserInformationPage(),
        binding: RegistrationFormBinding());

    //Find the newly created instance of the register form and fill it in with the user Data
    RegisterUSerController registerController =
        Get.find<RegisterUSerController>();

    //Get the user's phone number if the user has one on the google account
    final authHeaders = await googleSignIn.currentUser.authHeaders;
    await getContactInfo(authHeaders, currentUser.id);

    //Navigate to the next missing step
    Get.toNamed(UserInformationPage.routeName);
  }

  void loginUserWithGoogle(SocialLoginResult loginResult) async {
    await Get.find<UserController>().socialLoginUser(loginResult);
    Get.toNamed(MapPage.routeName);
  }

  Future<String> getContactInfo(authHeader, accountId) async {
    String url =
        "https://people.googleapis.com/v1/people/$accountId?personFields=phoneNumbers";

    var response = await http.get(url, headers: authHeader);

    print(response.body);
    return "Yes";
  }
}
