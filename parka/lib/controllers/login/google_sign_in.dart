import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  void signIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ["https://www.googleapis.com/auth/contacts.readonly"]);
    var response = await googleSignIn.signIn();
    print(response);
  }
}
