import 'package:ParkA/data/dtos/user/user_registration_dto.dart';
import 'package:get/state_manager.dart';

class RegisterUSerController extends GetxController {
  Rx<UserRegistrationForm> _userRegistrationForm =
      new UserRegistrationForm().obs;

  void setName(String _name) {
    _userRegistrationForm.update((_instance) {
      _instance.createUserDto.name = _name.trim();
    });
  }

  void setLastName(String _lastName) {
    _userRegistrationForm.update((_instance) {
      _instance.createUserDto.lastName = _lastName.trim();
    });
  }

  void setEmail(String _email) {
    _userRegistrationForm.update((_instance) {
      _instance.createUserDto.email = _email.trim();
    });
  }

  void setPassword(String _password) {
    _userRegistrationForm.update((_instance) {
      _instance.createUserDto.name = _password.trim();
    });
  }

  void setProfilePicture(String _imagePath) {
    _userRegistrationForm.update((_instance) {
      _instance.createUserDto.profilePicture = _imagePath;
    });
  }

  void setBirthDate(String _birthDate) {
    _userRegistrationForm.update((_instance) {
      _instance.createUserInformationDto.birthDate = _birthDate;
    });
  }

  void setDocumentNumber(String _documentNumber) {
    _userRegistrationForm.update((_instance) {
      _instance.createUserInformationDto.documentNumber =
          _documentNumber.trim();
    });
  }

  void setNationality(String _nationality) {
    _userRegistrationForm.update((_instance) {
      _instance.createUserInformationDto.nationality = _nationality;
    });
  }

  void setPlaceOfBirth(String _placeOfBirth) {
    _userRegistrationForm.update((_instance) {
      _instance.createUserInformationDto.nationality = _placeOfBirth;
    });
  }

  void setPhoneNumber(String _phone) {
    _userRegistrationForm.update((_instance) {
      _instance.createUserInformationDto.telephonNumber = _phone.trim();
    });
  }
}
