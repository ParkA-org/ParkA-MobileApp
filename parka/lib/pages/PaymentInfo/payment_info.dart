import 'package:ParkA/components/Buttons/transparent_button_test.dart';
import 'package:ParkA/pages/PaymentInfo/Components/credit_card_complete_info_form.dart';
import "package:flutter/material.dart";

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
  Map formHandlers;

  @override
  void initState() {
    super.initState();
    formHandlers = {
      "creditCardNameHandler": (value) {
        setState(() {
          this.fullName = value;
        });
      },
      "creditCardNumberHandlers": [
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
      "creditCardMonthHanlder": (value) {
        setState(() {
          this.creditCardMonth = value;
        });
      },
      "creditCardYearHandler": (value) {
        setState(() {
          this.creditCardYear = value;
        });
      },
      "creditCardCvvHandler": (value) {
        setState(
          () {
            this.creditCardCvv = value;
          },
        );
      },
    };
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
              flex: 0,
              child: Container(
                color: Colors.white,
                child: TransparentButtonWithIcon(
                  label: "Atras",
                  color: Color(0xFF0B768C),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: PaymentInfoCompleteForm(
                fullName: fullName,
                creditCardNumber1: creditCardNumber1,
                creditCardNumber2: creditCardNumber2,
                creditCardNumber3: creditCardNumber3,
                creditCardNumber4: creditCardNumber4,
                creditCardMonth: creditCardMonth,
                creditCardYear: creditCardYear,
                creditCardCvv: creditCardCvv,
                formHandlers: formHandlers,
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
