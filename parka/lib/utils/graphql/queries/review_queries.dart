const String getReviewByReservationQuery = r"""
query($data: GetReviewByIdInput!){
  getReviewByReservation(getReservationByReservationInput: $data){
    id
    user{
      id
      lastName
      name
      profilePicture
      email
    }
    type
    title
    calification
    review
  }
}
""";
