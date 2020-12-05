import 'package:ParkA/data/data-models/country/country_data_model.dart';
import 'package:ParkA/data/data-models/nationality/nationality_data_model.dart';
import 'package:ParkA/data/dtos/user/user_registration_dto.dart';
import 'package:get/state_manager.dart';

class RegisterUSerController extends GetxController {
  Rx<UserRegistrationForm> _userRegistrationForm =
      new UserRegistrationForm().obs;

  UserRegistrationForm get registrationForm => _userRegistrationForm.value;

  CreateUserDto get createUserDto =>
      this._userRegistrationForm.value.createUserDto;

  CreateUserInformationDto get createUserInformationDto =>
      this._userRegistrationForm.value.createUserInformationDto;

  void setName(String _name) {
    _userRegistrationForm.update((_instance) {
      this.createUserDto.name = _name.trim();
    });
  }

  void setLastName(String _lastName) {
    _userRegistrationForm.update((_instance) {
      this.createUserDto.lastName = _lastName.trim();
    });
  }

  void setEmail(String _email) {
    _userRegistrationForm.update((_instance) {
      this.createUserDto.email = _email.trim();
    });
  }

  void setPassword(String _password) {
    _userRegistrationForm.update((_instance) {
      this.createUserDto.password = _password.trim();
    });
  }

  void setProfilePicture(String _imagePath) {
    _userRegistrationForm.update((_instance) {
      this.createUserDto.profilePicture = _imagePath;
    });
  }

  void setBirthDate(DateTime _birthDate) {
    _userRegistrationForm.update((_instance) {
      this.createUserInformationDto.birthDate = _birthDate;
    });
  }

  void setDocumentNumber(String _documentNumber) {
    _userRegistrationForm.update((_instance) {
      this.createUserInformationDto.documentNumber = _documentNumber.trim();
    });
  }

  void setNationality(Nationality _nationality) {
    _userRegistrationForm.update((_instance) {
      this.createUserInformationDto.nationality = _nationality;
    });
  }

  void setPlaceOfBirth(Country _placeOfBirth) {
    _userRegistrationForm.update((_instance) {
      this.createUserInformationDto.placeOfBirth = _placeOfBirth;
    });
  }

  void setPhoneNumber(String _phone) {
    _userRegistrationForm.update((_instance) {
      this.createUserInformationDto.telephonNumber = _phone.trim();
    });
  }
}
