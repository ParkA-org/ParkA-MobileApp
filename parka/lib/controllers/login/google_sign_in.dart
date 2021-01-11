import 'dart:convert';

import 'package:ParkA/controllers/bindings/registration_controller_binding.dart';
import 'package:ParkA/controllers/register-user-form/register_user_controller.dart';
import 'package:ParkA/controllers/user_controller.dart';
import 'package:ParkA/data/data-models/google_contact/google_contact.dart';
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
    //Create new instance of the Register to fill the forms
    Get.lazyPut<RegisterUSerController>(() => RegisterUSerController());

    //Get the user's contact information and fills the previous forms
    final authHeaders = await googleSignIn.currentUser.authHeaders;
    await setUserInfo(authHeaders, currentUser.id);

    //Navigate to the next missing step
    Get.toNamed(UserInformationPage.routeName);
  }

  void loginUserWithGoogle(SocialLoginResult loginResult) async {
    await Get.find<UserController>().socialLoginUser(loginResult);
    Get.toNamed(MapPage.routeName);
  }

  Future<void> setUserInfo(authHeader, accountId) async {
    //Find the newly created instance of the register form and fill it in with the user Data
    final RegisterUSerController _registerController =
        Get.find<RegisterUSerController>();

    //People API V1
    String _url =
        "https://people.googleapis.com/v1/people/$accountId?personFields=names,emailAddresses,phoneNumbers,photos";

    //Response from API with all available info
    var _response = await http.get(_url, headers: authHeader);

    //Creates Google Contact from People API response
    GoogleContact _userInfo =
        GoogleContact.contactFromJson(jsonDecode(_response.body));

    // Sets Registration Form Information

    _registerController.setOrigin("google");
    _registerController.setEmail(_userInfo.email);
    _registerController.setName(_userInfo.firstName);
    _registerController.setLastName(_userInfo.lastName);
    _registerController.setProfilePicture(_userInfo.profilePictureUrl);
    if (!_userInfo.phoneNumber.isNull && _userInfo.phoneNumber.length > 9) {
      _registerController.setPhoneNumber(_userInfo.phoneNumber);
    }
  }
}
