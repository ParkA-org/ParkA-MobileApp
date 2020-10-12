import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/pages/PaymentInfo/payment_info.dart';
import 'package:ParkA/use-cases/payment/payment_use_cases.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../../components/Utils/parkaIcons.dart';

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
    this.userPaymentMethods = await PaymentUseCases.getAllUserPaymentMethods();

    setState(() {
      this.paymentsLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    this.paymentsLoaded = false;
    this.getAllUserPayment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ParkaColors.parkaGreen,
        child: Icon(Icons.add),
        onPressed: () {
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
                alignment: Alignment.centerLeft,
                child: Icon(
                  ParkaIcons.parkaCar,
                  color: Colors.white,
                  size: 130.0,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: this.paymentsLoaded ? ListView() : Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
