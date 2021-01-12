const String createParkingMutation = r"""
mutation ($data:CreateParkingInput!){
  createParking(
    createParkingInput: $data
  ) {
    id
  }
}
""";

const String deleteParkingMutation = r"""
mutation($data:String!){
  deleteParking(id:$data)
}
""";

const String updateParkingMutation = r"""
mutation($data: UpdateParkingInput!) {
  updateParking(updateParkingInput: $data) {
    id
  }
}
""";
