import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/data/dtos/payment/update_payment_dto.dart';
import 'package:ParkA/data/use-cases/payment/payment_use_cases.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'components/credit_card_complete_info_form.dart';

class EditPaymentScreen extends StatefulWidget {
  static String routeName = "/editPaymentScreen";

  @override
  _EditPaymentScreenState createState() => _EditPaymentScreenState();
}

class _EditPaymentScreenState extends State<EditPaymentScreen> {
  String fullName = "Nombre del titular";
  String creditCardNumber1 = "----";
  String creditCardNumber2 = "----";
  String creditCardNumber3 = "----";
  String creditCardNumber4 = "----";
  String creditCardMonth = "--";
  String creditCardYear = "--";
  String id;
  String creditCardCvv;
  String expirationDate;
  String card = "";
  Map formHandlers;
  UpdatePaymentDto updatePaymentDto = new UpdatePaymentDto();

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

  Future<void> sumbmitForm() async {
    this.updatePaymentDto.id = this.id;
    if (this.creditCardMonth.substring(0, 1) != "-") {
      if (this.creditCardMonth.length == 1) {
        this.creditCardMonth = "0" + this.creditCardMonth.toString();
      }
      this.updatePaymentDto.expirationDate = "20" +
          this.creditCardYear.toString() +
          "-" +
          this.creditCardMonth +
          "-01";
    }
    final updatePaymentResult =
        await PaymentUseCases.updatePayment(this.updatePaymentDto);

    if (updatePaymentResult) {
      print("updated");
      Navigator.pop(context);
    } else {
      Get.snackbar(
        "Error",
        "Se verifico un error",
        backgroundColor: ParkaColors.parkaGoogleRed,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Payment payment = ModalRoute.of(context).settings.arguments;

    this.fullName = payment.cardHolder;
    // this.creditCardMonth = payment.expirationDate.substring(5, 7);
    // this.creditCardYear = payment.expirationDate.substring(2, 4);
    this.creditCardNumber4 = payment.digit.substring(12, 16);
    this.updatePaymentDto.expirationDate = payment.expirationDate;
    this.id = payment.id;

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
                flex: 1,
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
                          label: "Actualizar metodo de pago",
                          buttonTextStyle: kParkaButtonTextStyle,
                          color: Colors.white,
                          onTapHandler: () {
                            sumbmitForm();
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
