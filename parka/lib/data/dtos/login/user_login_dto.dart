import 'package:ParkA/data/data-models/user/user_data_model.dart';

class UserLoginDto {
  final String jwt;
  final User user;

  UserLoginDto({
    this.jwt,
    this.user,
  });
}
