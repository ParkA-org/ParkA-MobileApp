import 'package:ParkA/data/data-models/user/user_data_model.dart';

class UserLoginDto {
  final bool status;
  final String message;
  final String jwt;
  final User user;

  UserLoginDto({
    this.jwt,
    this.user,
    this.status,
    this.message,
  });
}
