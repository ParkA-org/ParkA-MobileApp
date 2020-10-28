import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/styles/text.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class CardListTile extends StatelessWidget {
  final Payment payment;

  CardListTile({
    this.payment,
  });

  @override
  Widget build(BuildContext context) {
    String visible = this.payment.digit.substring(12, 16);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            this.payment.cardHolder,
            style: kParkaTextBaseStyleWhite.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 36.0,
            ),
          ),
          Row(
            children: [
              Text("text"),
              Column(
                children: [
                  Text(
                    "•••• $visible",
                    style: kParkaTextBaseStyleWhite.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("test"),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
            child: Divider(
              color: Colors.black,
              thickness: 0.9,
              endIndent: 0,
            ),
          ),
        ],
      ),
    );
  }
}
