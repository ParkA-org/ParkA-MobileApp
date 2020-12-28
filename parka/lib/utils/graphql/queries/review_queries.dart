const String getReviewByReservationQuery = r"""
query($data: GetReviewByIdInput!){
  getReviewByReservation(getReservationByReservationInput: $data){
    id
    title
    calification
    review
  }
}
""";
