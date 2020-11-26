import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";

class CardListTile extends StatelessWidget {
  final Payment payment;

  CardListTile({
    this.payment,
  });

  @override
  Widget build(BuildContext context) {
    String visible = this.payment.digit.substring(12, 16);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0),
      padding: EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: AutoSizeText(
              "${this.payment.cardHolder}",
              maxLines: 1,
              maxFontSize: 30,
              minFontSize: 26,
              style: kParkaTextBaseStyleWhite.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  this.payment.card == "Visa"
                      ? Image.network(
                          'https://parka-api-bucket-aws.s3.amazonaws.com/image_68_1915d643da.png',
                          width: 100,
                        )
                      : Image.network(
                          'https://parka-api-bucket-aws.s3.amazonaws.com/image_59_159f189071.png',
                          width: 100,
                        )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "• • • •  $visible",
                    maxLines: 1,
                    maxFontSize: 28,
                    minFontSize: 24,
                    style: kParkaTextBaseStyleWhite.copyWith(
                      color: Colors.black,
                      fontFamily: "Cousine",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        AutoSizeText(
                          "Estado: ",
                          maxLines: 1,
                          maxFontSize: 25,
                          minFontSize: 22,
                          style: TextStyle(
                            color: Color(0xff888383),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        this.payment.activated == true
                            ? AutoSizeText("Aprobada",
                                maxLines: 1,
                                maxFontSize: 25,
                                minFontSize: 22,
                                style: TextStyle(
                                  color: Color(0xff0CBD3D),
                                  fontWeight: FontWeight.bold,
                                ))
                            : AutoSizeText("Declinada",
                                maxLines: 1,
                                maxFontSize: 25,
                                minFontSize: 22,
                                style: TextStyle(
                                  color: Color(0xffBD0C0C),
                                  fontWeight: FontWeight.bold,
                                )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: AutoSizeText(
                      "Banco Popular Dominicano",
                      maxLines: 1,
                      maxFontSize: 18,
                      minFontSize: 17,
                      style: TextStyle(
                        color: Color(0xff888383),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
            child: Divider(
              color: Colors.black,
              thickness: 0.6,
            ),
          ),
        ],
      ),
    );
  }
}
