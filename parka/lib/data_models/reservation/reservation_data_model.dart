class Reservation {
  final String id;
  final String rentalId;
  final String checkInDate;
  final String checkOutDate;
  final String vehicleId;
  final String paymentInfoId;
  final String rentDate;
  final String total;
  //to be changed
  final String status;
  final String userId;

  Reservation({
    this.checkInDate,
    this.checkOutDate,
    this.id,
    this.paymentInfoId,
    this.rentDate,
    this.rentalId,
    this.status,
    this.total,
    this.userId,
    this.vehicleId,
  });
}
