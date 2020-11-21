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

const String getParkingByIdQuery = r"""
query($data:String!){
  getParkingById(id:$data){
    id
    countParking
    latitude
    longitude
    published
    parkingName
    calendar{
      id
    }
    priceHours
    pictures
    mainPicture
    isAvailable
    sector
    direction
    information
    features{
      id
      name
    }
    verified
    rating
  }
}""";

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
    rating
		verified
		features {
		id
		name
		}
	}
}

""";
