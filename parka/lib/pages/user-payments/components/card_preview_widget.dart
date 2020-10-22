import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/pages/create-payment/components/credit_card_complete_info_form.dart';
import 'package:ParkA/styles/text.dart';
import "package:flutter/material.dart";

class CardListTile extends StatelessWidget {
  final Payment payment;

  CardListTile({
    this.payment,
  });

  Map<String, dynamic> gradientGetter(String creditCardNumber) {
    if (creditCardNumber[0] == "4")
      return CreditCardTypes.visa.gradient;
    else if (creditCardNumber[0] == "5") {
      return CreditCardTypes.mastercard.gradient;
    }

    return CreditCardTypes.unknown.gradient;
  }

  @override
  Widget build(BuildContext context) {
    String visible = this.payment.digit.substring(0, 4);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        gradient:
            LinearGradient(colors: gradientGetter(this.payment.digit)["color"]),
        boxShadow: [
          BoxShadow(
            offset: Offset(3.0, 7.0),
            color: Colors.black38,
            blurRadius: 5.0,
          ),
        ],
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              this.payment.cardHolder,
              style: kParkaTextBaseStyleWhite.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "$visible - **** - **** - ****",
              style: kParkaTextBaseStyleWhite.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
