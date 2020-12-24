import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/people/v1.dart';
import 'package:http/http.dart' as http;

class GoogleSignInController extends GetxController {
  void signIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ["https://www.googleapis.com/auth/user.phonenumbers.read"]);
    var response = await googleSignIn.signIn();

    final authHeaders = await googleSignIn.currentUser.authHeaders;
    await getContactInfo(authHeaders, response.id);
    googleSignIn.signOut();
  }

  Future<String> getContactInfo(authHeader, accountId) async {
    String url =
        "https://people.googleapis.com/v1/people/$accountId?personFields=names,emailAddresses,phoneNumbers,birthdays";

    var response = await http.get(url, headers: authHeader);

    print(response.body);
    return "Yes";
  }
}
