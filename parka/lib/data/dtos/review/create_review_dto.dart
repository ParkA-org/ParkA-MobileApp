class CreateReviewDto {
  String parkingId;
  String reservationId;
  String review;
  String reviewedUser;
  int calification;
  bool type;
  String title;

  CreateReviewDto({
    this.calification,
    this.parkingId,
    this.reservationId,
    this.review,
    this.title,
    this.type,
    this.reviewedUser,
  });
}
