import 'package:ParkA/components/Cards/credit_card.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/pages/PaymentInfo/Components/credit_card_info_form.dart';
import 'package:ParkA/pages/PaymentInfo/utils/utils.dart';
import "package:flutter/material.dart";

class PaymentInfoCompleteForm extends StatelessWidget {
  const PaymentInfoCompleteForm(
      {Key key,
      @required this.fullName,
      @required this.creditCardNumber1,
      @required this.creditCardNumber2,
      @required this.creditCardNumber3,
      @required this.creditCardNumber4,
      @required this.creditCardMonth,
      @required this.creditCardYear,
      @required this.creditCardCvv,
      @required this.formHandlers})
      : super(key: key);

  final String fullName;
  final String creditCardNumber1;
  final String creditCardNumber2;
  final String creditCardNumber3;
  final String creditCardNumber4;
  final String creditCardMonth;
  final String creditCardYear;
  final String creditCardCvv;
  final Map formHandlers;

  Map<String, dynamic> gradientGetter() {
    if (this.creditCardNumber1.length > 0 && this.creditCardNumber1[0] == "4")
      return CreditCardTypes.visa.gradient;
    else if (this.creditCardNumber1.length > 1 &&
        this.creditCardNumber1[0] == "5") {
      return CreditCardTypes.mastercard.gradient;
    }

    return CreditCardTypes.unknown.gradient;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Metodo de pago",
            style: kParkaPageTitleTextStyle,
          ),
          CreditCardWidget(
            fullName: this.fullName,
            creditCardNumber1: this.creditCardNumber1,
            creditCardNumber2: this.creditCardNumber2,
            creditCardNumber3: this.creditCardNumber3,
            creditCardNumber4: this.creditCardNumber4,
            creditCardMonth: this.creditCardMonth,
            creditCardYear: this.creditCardYear,
            creditCardInfo: this.gradientGetter(),
          ),
          CreditCardInfoForm(
            creditCardNameHandler: this.formHandlers["creditCardNameHandler"],
            creditCardNumberHandlers:
                this.formHandlers["creditCardNumberHandlers"],
            creditCardMonthHanlder: this.formHandlers["creditCardMonthHanlder"],
            creditCardYearHandler: this.formHandlers["creditCardYearHandler"],
            creditCardCvvHandler: this.formHandlers["creditCardCvvHandler"],
          ),
        ],
      ),
    );
  }
}
