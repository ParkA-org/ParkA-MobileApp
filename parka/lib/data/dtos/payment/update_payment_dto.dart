class UpdatePaymentDto {
  String id;
  String cardHolder;
  String expirationDate;
  String digit;
  String card;
  String cvv;

  UpdatePaymentDto({
    this.id,
    this.card,
    this.cardHolder,
    this.cvv,
    this.digit,
    this.expirationDate,
  });
}
