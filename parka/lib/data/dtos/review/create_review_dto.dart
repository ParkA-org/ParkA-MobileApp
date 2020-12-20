class CreateReviewDto {
  String id;
  String userId;
  String parkingId;
  String reservationId;
  String review;
  int calification;
  bool type;
  String title;

  CreateReviewDto({
    this.calification,
    this.id,
    this.parkingId,
    this.reservationId,
    this.review,
    this.title,
    this.type,
    this.userId,
  });
}
