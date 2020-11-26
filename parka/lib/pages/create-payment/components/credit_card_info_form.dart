import 'package:ParkA/styles/inputs.dart';
import 'package:ParkA/styles/text.dart';
import "package:flutter/material.dart";

import 'credit_card_number_form.dart';

class CreditCardInfoForm extends StatelessWidget {
  const CreditCardInfoForm({
    Key key,
    @required this.creditCardCvvHandler,
    @required this.creditCardNumberHandlers,
    @required this.creditCardNameHandler,
    @required this.creditCardYearHandler,
    @required this.creditCardMonthHanlder,
  }) : super(key: key);

  final Function creditCardCvvHandler;
  final Function creditCardNameHandler;
  final Function creditCardMonthHanlder;
  final Function creditCardYearHandler;
  final List<Function> creditCardNumberHandlers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Numero Tarjeta",
          style: kParkaPaymentFormStyle,
        ),
        CreditCardNumberForm(
          formHandlers: this.creditCardNumberHandlers,
        ),
        Text(
          "Nombre del titular",
          textAlign: TextAlign.left,
          style: kParkaPaymentFormStyle,
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 50.0,
          child: TextField(
            enabled: false,
            decoration: kInputStyleSlim,
            onChanged: this.creditCardNameHandler,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Valido Hasta",
                    textAlign: TextAlign.left,
                    style: kParkaPaymentFormStyle,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 50.0,
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                              decoration: kInputStyleSlim,
                              keyboardType: TextInputType.number,
                              onChanged: this.creditCardMonthHanlder),
                        ),
                      ),
                      Text(
                        "/",
                        style: TextStyle(
                          color: Color(0xFF0B768C),
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50.0,
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: kInputStyleSlim,
                            keyboardType: TextInputType.number,
                            onChanged: this.creditCardYearHandler,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "CVV",
                    textAlign: TextAlign.left,
                    style: kParkaPaymentFormStyle,
                  ),
                  Container(
                    height: 50.0,
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: false,
                      decoration: kInputStyleSlim,
                      keyboardType: TextInputType.number,
                      onChanged: this.creditCardCvvHandler,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
