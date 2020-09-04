import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
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
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: ParkaHeader(),
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
              Flexible(
                flex: 2,
                child: WavyClipper.withTopWave(
                  child: Container(
                    color: Color(0xFF0B768C),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: TransparentButton(
                            label: "Continuar",
                            buttonTextStyle: kParkaButtonTextStyle,
                            color: Colors.white,
                            trailingIconData: Icons.arrow_forward_ios,
                          ),
                        ),
                        Expanded(
                          child: TransparentButton(
                            buttonTextStyle: kParkaButtonTextStyle,
                            label: "Omitir",
                            color: Color(0xFFB3E8FF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
