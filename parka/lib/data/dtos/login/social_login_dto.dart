import 'package:ParkA/data/data-models/user/user_data_model.dart';

class SocialLoginResult {
  final String jwt;
  final bool userIsRegistered;
  final User user;
  final String origin;

  SocialLoginResult({this.origin, this.jwt, this.userIsRegistered, this.user});
}
