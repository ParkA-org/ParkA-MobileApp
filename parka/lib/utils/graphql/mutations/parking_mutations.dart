const String createParkingMutation = r"""
mutation ($data:CreateParkingInput!){
  createParking(
    createParkingInput: $data
  ) {
    id
  }
}
""";
