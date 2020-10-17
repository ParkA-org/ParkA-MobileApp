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

  CreateUserDto({
    this.name,
    this.lastName,
    this.email,
    this.password,
    this.profilePicture,
    this.userInformation,
  });
}

class CreateUserInformationDto {
  String documentNumber;
  String telephonNumber;
  String birthDate;
  String placeOfBirth;
  String nationality;

  CreateUserInformationDto({
    this.birthDate,
    this.documentNumber,
    this.nationality,
    this.placeOfBirth,
    this.telephonNumber,
  });
}

class CreatePaymentDto {
  String cardHolder;
  String expirationDate;
  String digit;
  String card;
  String cvv;

  CreatePaymentDto({
    this.card,
    this.cardHolder,
    this.cvv,
    this.digit,
    this.expirationDate,
  });
}
