class Payment {
  String id;
  String cardHolder;
  String expirationDate;
  String digit;
  String card;
  String cardId;
  bool activated;

  Payment({
    this.id,
    this.cardHolder,
    this.activated,
    this.digit,
    this.expirationDate,
    this.card,
    this.cardId,
  });

  static paymentsFromJson(List paymentsData) {
    List<Payment> ret = new List<Payment>();

    print(paymentsData.length);

    for (var payment in paymentsData) {
      ret.add(
        Payment(
          id: payment["id"],
          activated: payment["activated"],
          cardHolder: payment["cardHolder"],
          digit: payment["digit"],
          expirationDate: payment["expirationDate"],
          cardId: payment["card"]["id"],
          card: payment["card"]["name"],
        ),
      );
    }

    return ret;
  }
}
