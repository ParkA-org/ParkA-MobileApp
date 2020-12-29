const String createReservationMutation = r""" 
mutation($data:CreateReservationInput!){
  createReservation(createReservationInput:$data){
    id
  }
}
""";

const String cancelReservationMutation = r"""
mutation($data: CancelReservationInput!){
  cancelReservation(cancelReservationInput: $data){
    id
  }
}
""";
