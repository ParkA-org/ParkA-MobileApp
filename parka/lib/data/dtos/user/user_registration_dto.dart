import 'package:ParkA/data/data-models/country/country_data_model.dart';
import 'package:ParkA/data/data-models/nationality/nationality_data_model.dart';
import 'package:ParkA/data/dtos/payment/create_payment_dto.dart';

class UserRegistrationForm {
  CreateUserDto createUserDto;
  CreateUserInformationDto createUserInformationDto;
  CreatePaymentDto createPaymentDto;

  UserRegistrationForm() {
    this.createPaymentDto = new CreatePaymentDto();
    this.createUserDto = new CreateUserDto();
    this.createUserInformationDto = new CreateUserInformationDto();
  }
}

class CreateUserDto {
  String name;
  String lastName;
  String email;
  String password;
  String profilePicture;
  String userInformation;
  String origin;

  CreateUserDto(
      {this.name,
      this.lastName,
      this.email,
      this.password,
      this.profilePicture,
      this.userInformation,
      this.origin});
}

class CreateUserInformationDto {
  String documentNumber;
  String telephonNumber;
  DateTime birthDate;
  Country placeOfBirth;
  Nationality nationality;

  CreateUserInformationDto({
    this.birthDate,
    this.documentNumber,
    this.nationality,
    this.placeOfBirth,
    this.telephonNumber,
  }) {
    print("INICIA A TU JEVA");
  }
}
