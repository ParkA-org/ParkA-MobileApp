const String getAllUserParkingQuery = r"""
query {
  getAllUserParkings {
    id
    rating
    pictures
    mainPicture
    parkingName
    information
    latitude
    direction
    longitude
    priceHours
    countParking
    user {
      id
    }
    isAvailable
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
  }
}

""";

const String getNearbyParkingsQuery = r"""
query($userLocation: FilterInput!) {
  getAllParkings(input: $userLocation) {
    id
    user {
      id
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
    latitude
    longitude
    mainPicture
    pictures
    parkingName
    priceHours
    rating
    verified
    isAvailable
    features {
      id
      name
    }
  }
}

""";

const String getFilteredParkingsQuery = r"""
query($data: FilterInput!) {
  getAllParkings(input: $data) {
    id
    user {
      id
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
    latitude
    longitude
    mainPicture
    pictures
    parkingName
    priceHours
    rating
    verified
    isAvailable
    features {
      id
      name
    }
  }
}

""";

const String getAllParkings = r"""
query {
  getAllParkings(input: { where: {} }) {
    id
    countParking
    latitude
    longitude
    published
    priceHours
    pictures
    mainPicture
    isAvailable
    sector
    direction
    information
    isAvailable
    features {
      name
      id
    }
    verified
    rating
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
  }
}
""";

const String getParkingAvaliabilityQuery = r""" 
query($data: GetParkingCalendarInput!) {
  getParkingAvaliability(getParkingCalendarInput: $data) {
    id
    date
    parking
    schedules {
      start
      finish
    }
  }
}

""";
