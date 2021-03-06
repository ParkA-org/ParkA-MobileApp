const String getAllUserVehiclesQuery = r"""
query {
  getAllUserVehicles {
    id
    licensePlate
    model {
      name
      make {
        id
        name
      }
    }
    verified
    detail
    colorExterior {
      name
    }
    mainPicture
    pictures
    year
    alias
    bodyStyle {
      name
    }
  }
}

""";

const String getVehicleByIdQuery = r"""
query($input: GetVehicleByIdInput!) {
  getVehicleById(getVehicleByIdInput: $input) {
    id
    model {
      id
      name
      make {
        id
        name
      }
    }
    licensePlate
    verified
    detail
    colorExterior {
      id
      name
    }
    mainPicture
    pictures
    year
    alias
    bodyStyle {
      id
      name
    }
  }
}

""";
