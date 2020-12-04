class Review {
  String id;
  String userId;
  String parkingId;
  String reservationId;
  String review;
  int calification;
  String type;
  String title;

  Review({
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
