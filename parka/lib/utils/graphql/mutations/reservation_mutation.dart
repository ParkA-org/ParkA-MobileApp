const String createReservationMutation = r""" 
mutation($data:CreateReservationInput!){
  createReservation(createReservationInput:$data){
    id
  }
}
""";

const String cancelReservation = r"""
mutation($data: CancelReservationInput!){
  cancelReservation(cancelReservationInput: $data){
    id
  }
}
""";
