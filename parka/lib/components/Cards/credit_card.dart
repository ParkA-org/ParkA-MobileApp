import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreditCardWidget extends StatelessWidget {
  final String fullName;
  final String creditCardNumber1;
  final String creditCardNumber2;
  final String creditCardNumber3;
  final String creditCardNumber4;
  final String creditCardMonth;
  final String creditCardYear;
  final Map<String, dynamic> creditCardInfo;

  const CreditCardWidget(
      {Key key,
      this.fullName,
      this.creditCardNumber1,
      this.creditCardNumber2,
      this.creditCardNumber3,
      this.creditCardNumber4,
      this.creditCardMonth,
      this.creditCardYear,
      @required this.creditCardInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: this.creditCardInfo['color'],
        ),
      ),
      height: 190.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(
                this.creditCardInfo['icon'],
                color: Colors.white,
              ),
            ],
          ),
          Text(
            "${this.creditCardNumber1} ${this.creditCardNumber2} ${this.creditCardNumber3} ${this.creditCardNumber4}",
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white,
                wordSpacing: 10.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text(
                  this.fullName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  "Valido \n hasta",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: Text(
                  "${this.creditCardMonth}/${this.creditCardYear}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
