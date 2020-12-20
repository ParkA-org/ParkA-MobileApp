import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";

class PaymentCardTile extends StatelessWidget {
  const PaymentCardTile({
    Key key,
    @required this.payment,
    this.onTapHandler,
  }) : super(key: key);

  final Payment payment;
  final Function onTapHandler;

  String _getCardType() {
    if (this.payment.card == "Visa") {
      return 'https://parka-api-bucket-aws.s3.amazonaws.com/image_68_1915d643da.png';
    }

    return "https://parka-api-bucket-aws.s3.amazonaws.com/image_59_159f189071.png";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Container(
          height: 60.0,
          child: Row(
            children: [
              Expanded(
                child: this.payment == null
                    ? Container(
                        child: AutoSizeText(
                          "Selecciona un metodo de pago",
                          maxLines: 1,
                          style: kParkaTextStyleGrey18,
                        ),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  this.payment.cardHolder,
                                  style: kParkaTextStyleBoldBlack18,
                                ),
                                Text(
                                  "• • • •  ${this.payment.digit.substring(12)}",
                                  style: kParkaTextStyleBoldBlack18,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Image.network(_getCardType()),
                            ),
                          )
                        ],
                      ),
              ),
              Expanded(
                flex: 0,
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFF949494),
                ),
              )
            ],
          )),
    );
  }
}
