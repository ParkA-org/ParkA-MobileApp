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
query{
  getAllUserReservationsAsOwner{
    id   
    checkInDate
    checkOutDate
    rentDate
    total
    client{
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
    owner{
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
    vehicle{
      id
      pictures
      mainPicture
      alias
    }
    parking{
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
query{
  getAllUserReservationsAsClient{
    id 
    checkInDate
    checkOutDate
    rentDate
    total
    client{
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
    owner{
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
    vehicle{
      id
      pictures
      mainPicture
      alias
    }
    parking{
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
query($data: GetReservationById!){
  getReservationById(getReservationByIdInput: $data){
    id
    checkInDate
    checkOutDate
    client{
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
    owner{
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
    vehicle{
      id
      pictures
      mainPicture
      alias
    }
    parking{
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
