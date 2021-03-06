import 'package:ParkA/components/cards/credit_card.dart';
import 'package:ParkA/pages/edit-payment/components/credit_card_info_form.dart';
import 'package:ParkA/styles/text.dart';
import "package:flutter/material.dart";

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum CreditCardTypes { visa, mastercard, unknown }

extension CreditCard on CreditCardTypes {
  static const Map cards = {
    CreditCardTypes.mastercard: {
      "icon": FontAwesomeIcons.ccMastercard,
      "color": [
        Color(0xFF042843),
        Color(0xFF726E9E),
      ]
    },
    CreditCardTypes.visa: {
      "icon": FontAwesomeIcons.ccVisa,
      "color": [
        Color(0xFF52B6FE),
        Color(0xFF6154FE),
      ]
    },
    CreditCardTypes.unknown: {
      "icon": FontAwesomeIcons.ccAmazonPay,
      "color": [
        Color(0xFF3D79A2),
        Color(0xFF215787),
      ]
    }
  };

  Map<String, dynamic> get gradient => cards[this];
}

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
