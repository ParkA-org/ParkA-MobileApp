import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/use-cases/payment/payment_use_cases.dart';
import 'package:ParkA/pages/create-payment/payment_info.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/parkaIcons.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'components/card_preview_widget.dart';

class UserPaymentMethodsScreen extends StatefulWidget {
  static const String routeName = "/user-payment-methods";

  @override
  _UserPaymentMethodsScreenState createState() =>
      _UserPaymentMethodsScreenState();
}

class _UserPaymentMethodsScreenState extends State<UserPaymentMethodsScreen> {
  final graphqlClient = Get.find<GraphqlClientController>();
  bool paymentsLoaded;
  List userPaymentMethods;

  Future getAllUserPayment() async {
    this.paymentsLoaded = false;
    this.userPaymentMethods = await PaymentUseCases.getAllUserPaymentMethods();

    setState(() {
      this.paymentsLoaded = true;
    });
  }

  List<Widget> buildPaymentView() {
    List<Widget> ret = new List<Widget>();

    this.userPaymentMethods.forEach((element) {
      ret.add(CardListTile(
        payment: element,
      ));
    });

    return ret;
  }

  @override
  void initState() {
    super.initState();

    this.getAllUserPayment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.add,
        onPressedHandler: () {
          Get.toNamed(PaymentInfoScreen.routeName);
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: ParkaColors.parkaGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3.0, 7.0),
                        color: Colors.black38,
                        blurRadius: 5.0,
                      ),
                    ]),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: ParkaHeader(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          ParkaIcons.parkaCar,
                          color: Colors.white,
                          size: 130.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: this.paymentsLoaded
                  ? RefreshIndicator(
                      onRefresh: this.getAllUserPayment,
                      child: ListView(
                        children: buildPaymentView(),
                      ),
                    )
                  : Container(
                      child: Center(
                        child: Text("Todavia no tienes metodos de pago"),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
