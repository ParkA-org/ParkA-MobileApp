import 'package:ParkA/components/cards/credit_card_mini_tile.dart';
import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/styles/text.dart';
import "package:flutter/material.dart";

class PaymentMethodSelectorWidget extends StatelessWidget {
  final Function onTapHandler;
  final Payment payment;

  const PaymentMethodSelectorWidget({
    Key key,
    this.payment,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Metodo de pago",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        PaymentCardTile(
          payment: payment,
          onTapHandler: this.onTapHandler,
        ),
      ],
    );
  }
}
