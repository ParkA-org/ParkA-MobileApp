const String createReviewMutation = r""" 
mutation($data: CreateReviewInput!){
  createReview(createReviewInput: $data){
    id
  }
}
""";
