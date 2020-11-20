const String getAllUserParkingQuery = r"""
  query{
  getAllUserParkings{
    id
    rating
    pictures
    mainPicture
    parkingName
    information
    latitude
    longitude
    priceHours
    countParking
    user{
      id
    }
  }
}
""";

const String getNearbyParkingsQuery = r"""
query($userLocation: FilterInput!) {
	getAllParkings(
	input:$userLocation
	) 
  {
		id
		latitude
		longitude
		mainPicture
		parkingName
		priceHours
		verified
		features {
		id
		name
		}
	}
}

""";
