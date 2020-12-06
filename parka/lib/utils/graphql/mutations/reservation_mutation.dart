const String createReservationMutation = r""" 
mutation($data:CreateReservationInput!){
  createReservation(createReservationInput:$data){
    id
  }
}
""";
