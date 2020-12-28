import 'package:ParkA/data/data-models/user/user_data_model.dart';

class SocialLoginResult {
  final String jwt;
  final bool userIsRegistered;
  final User user;

  SocialLoginResult({this.jwt, this.userIsRegistered, this.user});
}
