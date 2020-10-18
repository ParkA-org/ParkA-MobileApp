class CreatePaymentDto {
  String cardHolder;
  String expirationDate;
  String digit;
  String card;
  String cvv;

  CreatePaymentDto({
    this.card,
    this.cardHolder,
    this.cvv,
    this.digit,
    this.expirationDate,
  });
}
