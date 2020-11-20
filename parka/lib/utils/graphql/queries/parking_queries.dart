const String getAllUserParkingQuery = r"""
  query{
  getAllUserParkings{
    id
    pictures
    mainPicture
    parkingName
    information
    latitude
    longitude
    countParking
    user{
      id
    }
  }
}
""";
