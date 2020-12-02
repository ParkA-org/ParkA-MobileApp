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
query($data: String!) {
  getParkingById(id: $data) {
    id
    countParking
    latitude
    longitude
    published
    parkingName
    calendar {
      id
      parkingId
      monday {
        start
        finish
      }
      monday {
        start
        finish
      }
      tuesday {
        start
        finish
      }
      wednesday {
        start
        finish
      }
      thursday {
        start
        finish
      }
      friday {
        start
        finish
      }
      saturday {
        start
        finish
      }
      sunday {
        start
        finish
      }
    }
    priceHours
    pictures
    mainPicture
    isAvailable
    sector
    direction
    information
    features {
      id
      name
    }
    verified
    rating
    user{
      id
      name
      lastName
      profilePicture
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
    pictures
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

const String getParkingAvaliabilityQuery = r""" 
query($data:GetParkingCalendarInput!){
  getParkingAvaliability(getParkingCalendarInput:$data){
    id
    date
    parking
    schedules{
      start
      finish
    }
  }
}
""";
