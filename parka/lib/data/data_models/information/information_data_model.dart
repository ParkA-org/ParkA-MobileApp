class Information {
  String id;
  String paymentInformationId;
  String document;
  List<String> vehicleId;
  List<String> parkingId;
  String telephoneNumber;
  String dateBirth;
  String placeOfBirth;
  String nationality;

  Information({
    this.id,
    this.dateBirth,
    this.document,
    this.nationality,
    this.parkingId,
    this.paymentInformationId,
    this.placeOfBirth,
    this.telephoneNumber,
    this.vehicleId,
  });
}
