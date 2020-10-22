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
