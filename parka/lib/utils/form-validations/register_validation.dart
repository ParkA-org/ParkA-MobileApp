import 'package:ParkA/data/dtos/user/user_registration_dto.dart';
import 'package:get/utils.dart';

bool validateRegister(UserRegistrationForm _userRegistrationForm) {
  if (_userRegistrationForm.createUserDto.name == null) {
    return false;
  }

  if (_userRegistrationForm.createUserDto.lastName == null) {
    return false;
  }

  if (_userRegistrationForm.createUserDto.email == null ||
      !GetUtils.isEmail(_userRegistrationForm.createUserDto.email)) {
    return false;
  }

  if (_userRegistrationForm.createUserDto.password == null ||
      _userRegistrationForm.createUserDto.password.length < 8) {
    return false;
  }

  if (_userRegistrationForm.createUserInformationDto.telephonNumber == null ||
      _userRegistrationForm.createUserInformationDto.telephonNumber.length !=
          10) {
    return false;
  }

  return true;
}

bool validateUserInformation(UserRegistrationForm _userRegistrationForm) {
  if (_userRegistrationForm.createUserInformationDto.documentNumber == null ||
      _userRegistrationForm.createUserInformationDto.documentNumber.length !=
          11) {
    return false;
  }

  if (_userRegistrationForm.createUserInformationDto.birthDate == null) {
    return false;
  }

  if (_userRegistrationForm.createUserInformationDto.nationality == null) {
    return false;
  }

  if (_userRegistrationForm.createUserInformationDto.placeOfBirth == null) {
    return false;
  }

  return true;
}
