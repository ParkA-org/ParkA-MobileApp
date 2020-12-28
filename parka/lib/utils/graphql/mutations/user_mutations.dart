const String loginMutation = r'''
mutation($input: LoginUserInput!) {
  login(loginUserInput: $input) {
    JWT
    user {
      id
      name
      email
      lastName
      profilePicture
      reviews {
        id
        user {
          id
          name
          lastName
          profilePicture
        }
        calification
        review
      }
    }
  }
}
    
''';

const String socialLoginMutation = r"""
mutation($input: SocialLoginInput!){
  socialLogin(socialLoginInput: $input){
    JWT
    user{
      id
      name
    }
    register
  }
}
""";

const String createUserMutation = r"""
    mutation($data:CreateUserInput!){
      createUser(createUserInput:$data){
        name
        lastName
        email
        profilePicture
        confirmed
        origin
      }
    }
    """;

const String createUserInformationMutation = r"""
    mutation($data:CreateUserInformationInpuType!) {
  createUserInformation(
    createUserInformationInpuType: $data
  ) {
    id
    documentNumber
    telephoneNumber
    birthDate
    placeOfBirth {
      name
    }
    nationality {
      id
      name
    }
  }
}
    """;

const String confirmUserEmailMutation = r"""
    mutation($data:ValidateEmailCodeInput!){
      validateEmailCode(validateEmailCodeInput:$data){
        email
        origin
      }
    }""";

const String resendConfirmationCodeMutation = r"""
    mutation($data:ValidateEmailCodeInput!){
      validateEmailCode(validateEmailCodeInput:$data){
        email
        origin
      }
    }""";

const String requestResetPasswordMutation = r"""
    mutation($data:ResetPasswordInput!){
      resetPassword(resetPasswordInput:$data){
        email
        origin
      }
    }
    """;

const String resetPasswordMutation = r'''
    mutation($data:ValidateResetPasswordCodeInput!){
      validateResetPasswordCode(validateResetPasswordCodeInput:$data){
        email
        origin
      }
    }
    ''';

const String updateUserPasswordMutation = r"""
mutation($data:UpdateUserPasswordInput!){
  updateUserPassword(updateUserPasswordInput:$data){
    email
  }
}
""";

const String updateUserMutation = r'''
mutation($data: UpdateUserInput!) {
  updateUser(updateUserInput: $data) {
    name
    lastName
    email
    profilePicture
    confirmed
    origin
    reviews {
      id
      user {
        id
        name
        lastName
        profilePicture
      }
      calification
      review
    }
  }
}

''';

const String updateUserInformationMutation = r"""
    mutation($data:UpdateUserInformationInput!){
      updateUserInformation(updateUserInformationInput:$data){
        documentNumber
        telephoneNumber
        birthDate
        placeOfBirth{
          name
        }
        nationality{
          name
        }
      }
    }
    """;

const requestNewAccountConfirmationCode = r""" 
mutation ($data:ConfirmEmailInput!){
  confirmEmail(
    confirmEmailInput: $data
  ) {
    email
    origin
  }
}

""";
