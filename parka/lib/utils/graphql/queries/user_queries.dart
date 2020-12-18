const String getUserInformationQuery = r"""
query {
  getUserInformationById {
    id
    documentNumber
    telephoneNumber
    birthDate
    placeOfBirth {
      name
    }
    nationality {
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
""";

const String getUserByIdQuery = r""" 
query($id: String!) {
  getUserById(id: $id) {
    id
    name
    lastName
    profilePicture
    reviews {
      id
      user {
        id
        name
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
      calification
      review
    }
  }
}

""";
