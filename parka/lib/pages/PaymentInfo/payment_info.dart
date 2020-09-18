import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Utils/curves_painter.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import 'package:ParkA/pages/MapPage/maps_page.dart';
import 'package:ParkA/pages/PaymentInfo/Components/credit_card_complete_info_form.dart';
import 'package:ParkA/pages/PaymentInfo/utils/createAccount.dart';
import "package:flutter/material.dart";

class PaymentInfoScreen extends StatefulWidget {
  static String routeName = "/paymentInfoPage";
  // Object arguments;
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
    Map<String, dynamic> createAccount =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: ParkaHeader(
                  color: ParkaColors.parkaGreen,
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
              Flexible(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: ParkaColors.parkaGreen,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        16.0,
                      ),
                      topRight: Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: TransparentButton(
                          label: "Continuar",
                          buttonTextStyle: kParkaButtonTextStyle,
                          color: Colors.white,
                          trailingIconData: Icons.arrow_forward_ios,
                          onTapHandler: () async => {
                            createAccount["paymentpage"]["digit"] =
                                creditCardNumber1 +
                                    creditCardNumber2 +
                                    creditCardNumber3 +
                                    creditCardNumber4,
                            createAccount["paymentpage"]["name"] = fullName,
                            createAccount["paymentpage"]["expirationdate"] =
                                "20" +
                                    creditCardYear +
                                    "-" +
                                    creditCardMonth +
                                    "-01",
                            await createUser(createAccount),
                            // Navigator.pushNamed(
                            //   context,
                            //   PaymentInfoScreen.routeName,
                            //   arguments: createAccount,
                            // )
                          },
                        ),
                      ),
                      Expanded(
                        child: TransparentButton(
                          buttonTextStyle: kParkaButtonTextStyle,
                          label: "Omitir",
                          color: ParkaColors.parkaLightGreen,
                          onTapHandler: () async => {
                            createAccount["paymentpage"]["digit"] = 0,
                            await createUser(createAccount),
                            // Navigator.pushNamed(
                            //   context,
                            //   PaymentInfoScreen.routeName,
                            //   arguments: createAccount,
                            // )
                          },
                        ),
                      ),
                    ],
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
