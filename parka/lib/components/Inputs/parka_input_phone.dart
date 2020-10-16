// Author: Silvio Arzeno
//
// Date: 8/3/2020
//
// Description: A generic Input Widget that takes Icon, text , IsPassword
// As well as preffered text color or text decoration. Default Values are
// Icon: WhiteProfileIcon.svg
// Text: Correo/ Usuario
// Text Decorations: Monserrat, White, 16, Bold
//
// Change Log:
// -8/3/2020 Silvio Arzeno: Widget created
//

import 'package:ParkA/styles/inputs.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ParkADobleInput extends StatelessWidget {
  const ParkADobleInput({
    Key key,
    @required this.creditCardMonthHanlder,
    @required this.creditCardYearHandler,
    @required this.creditCardCvvHandler,
  }) : super(key: key);

  final Function creditCardMonthHanlder;
  final Function creditCardYearHandler;
  final Function creditCardCvvHandler;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  decoration: kInputStyleSlim,
                  keyboardType: TextInputType.number,
                  onChanged: this.creditCardCvvHandler,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
