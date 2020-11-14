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
