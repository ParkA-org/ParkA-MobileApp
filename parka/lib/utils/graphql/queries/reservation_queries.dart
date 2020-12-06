const String getAllReservationAsOwnerQuery = r"""


""";

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
    }
    owner{
      id
      name
      lastName
      profilePicture
    }
    vehicle{
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
    }
    status
  }
}
""";
