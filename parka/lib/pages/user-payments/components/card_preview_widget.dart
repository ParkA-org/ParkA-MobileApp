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
          Padding(
            padding: const EdgeInsets.only(left: 14.0),
            child: Text(
              this.payment.cardHolder,
              style: kParkaTextBaseStyleWhite.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 36.0,
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
                  Text(
                    " • • • •  $visible",
                    style: kParkaTextBaseStyleWhite.copyWith(
                      color: Colors.black,
                      fontFamily: "Montserrat",
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Estado: ",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Color(0xff888383),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      this.payment.activated == true
                          ? Text("Aprobada",
                              style: TextStyle(
                                  color: Color(0xff0CBD3D),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0))
                          : Text("Declinada",
                              style: TextStyle(
                                  color: Color(0xffBD0C0C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0)),
                    ],
                  ),
                  Text("Banco Popular Dominicano")
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
