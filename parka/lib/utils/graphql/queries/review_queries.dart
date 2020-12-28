const String getReviewByReservationQuery = r"""
query($data: GetReviewByIdInput!){
  getReviewByReservation(getReservationByReservationInput: $data){
    id
        user {
          id
          name
          lastName
          profilePicture
        }
    type
    title
        calification
        review
  }
}
}
""";
