// ignore: todo
//TODO: Optimize these queries, create a controller

const String getAllReservationAsOwnerCountQuery = r"""
query{
  getAllUserReservationsAsOwner{
    id    
  }
}
""";

const String getAllReservationAsClientCountQuery = r"""
query{
  getAllUserReservationsAsClient{
    id    
  }
}
""";
const String getAllReservationAsOwnerQuery = r"""
query {
  getAllUserReservationsAsOwner {
    id
    checkInDate
    checkOutDate
    rentDate
    total
    reviewed
    client {
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
    owner {
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
    vehicle {
      id
      pictures
      mainPicture
      alias
    }
    parking {
      id
      parkingName
      priceHours
      mainPicture
      rating
      pictures
    }
    status
  }
}

""";

const String getAllReservationAsClientQuery = r"""
query {
  getAllUserReservationsAsClient {
    id
    checkInDate
    checkOutDate
    rentDate
    total
    reviewed
    client {
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
    owner {
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
    vehicle {
      id
      pictures
      mainPicture
      alias
    }
    parking {
      id
      parkingName
      priceHours
      mainPicture
      rating
      pictures
    }
    status
  }
}

""";

const String getReservationByIdQuery = r"""
query($data: GetReservationById!) {
  getReservationById(getReservationByIdInput: $data) {
    id
    checkInDate
    checkOutDate
    reviewed
    rentDate
    total
    paymentInfo{
      id
      cardHolder
      expirationDate
      digit
      activated
      card{
        id
        name
      }
    }
    client {
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
    owner {
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
    vehicle {
      id
      pictures
      mainPicture
      alias
      model{
        id
        make{
          id
          name
          icon
        }
        name
      }
    }
    parking {
      id
      parkingName
      priceHours
      mainPicture
      rating
      pictures
      user{
        id
        name
        lastName
        email
        profilePicture
      }
    }
    status
  }
}
""";
