const String getReviewByReservation = r"""
query($data: GetReviewByIdInput!){
  getReviewByReservation(getReservationByReservationInput: $data){
    id
    title
    calification
    review
  }
}
""";
