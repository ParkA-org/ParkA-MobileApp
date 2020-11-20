const String getAllUserParkingQuery = r"""
  query{
  getAllUserParkings{
    id
    pictures
    mainPicture
    parkingName
    information
    user{
      id
    }
  }
}
""";
