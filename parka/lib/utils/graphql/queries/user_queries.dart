const String getUserInformationQuery = r"""
      query{
        getUserInformationById{
          id
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

const String getLoggedUserQuery = r"""
query{
  getLoggedUser{
    id
    name
    lastName
    email
    profilePicture
    confirmed
  }
}
""";
