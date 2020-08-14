import 'package:ParkA/components/Buttons/transparent_button_test.dart';
import 'package:ParkA/components/Cards/credit_card.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:ParkA/pages/PaymentInfo/Components/credit_card_info_form.dart';
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

class PaymentInfoScreen extends StatefulWidget {
  static String routeName = "/paymentInfoPage";

  @override
  _PaymentInfoScreenState createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  String fullName = "Nombre del titular";
  String creditCardNumber1 = "----";
  String creditCardNumber2 = "----";
  String creditCardNumber3 = "----";
  String creditCardNumber4 = "----";
  String creditCardMonth = "--";
  String creditCardYear = "--";
  String creditCardCvv;

  Map<String, dynamic> gradientGetter() {
    if (this.creditCardNumber1.length > 0 && this.creditCardNumber1[0] == "4")
      return CreditCardTypes.visa.gradient;
    else if (this.creditCardNumber1.length > 1 &&
        this.creditCardNumber1[0] == "5") {
      print("mastercardo");
      return CreditCardTypes.mastercard.gradient;
    }

    return CreditCardTypes.unknown.gradient;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFF0B768C),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: WavyHeaderImage(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TransparentButtonWithIcon(
                          label: "Atras",
                          color: Color(0xFF0B768C),
                        ),
                        Text(
                          "Metodo de pago",
                          style: TextStyle(
                              color: Color(0xFF0B768C),
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold),
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
                            creditCardNameHandler: (value) {
                              setState(() {
                                this.fullName = value;
                              });
                            },
                            creditCardNumberHandlers: [
                              (value) {
                                setState(() {
                                  this.creditCardNumber1 = value;
                                });
                              },
                              (value) {
                                setState(() {
                                  this.creditCardNumber2 = value;
                                });
                              },
                              (value) {
                                setState(() {
                                  this.creditCardNumber3 = value;
                                });
                              },
                              (value) {
                                setState(() {
                                  this.creditCardNumber4 = value;
                                });
                              },
                            ],
                            creditCardMonthHanlder: (value) {
                              setState(() {
                                this.creditCardMonth = value;
                              });
                            },
                            creditCardYearHandler: (value) {
                              setState(() {
                                this.creditCardYear = value;
                              });
                            },
                            creditCardCvvHandler: (value) {
                              setState(() {
                                this.creditCardCvv = value;
                              });
                              print(this.creditCardCvv);
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: TransparentButtonWithRightIcon(
                      label: "Continuar",
                      color: Colors.white,
                      icon: Icons.arrow_forward_ios,
                    ),
                  ),
                  Expanded(
                    child: TransparentButtonWithRightIcon(
                      label: "Omitir",
                      color: Color(0xFFB3E8FF),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

const kInputStyle = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(color: Colors.grey),
  filled: true,
  counterText: "",
  fillColor: Color(0xFFD7D2D2),
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);
