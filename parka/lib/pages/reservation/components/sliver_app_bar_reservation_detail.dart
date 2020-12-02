import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SliverAppBarReservationDetail extends StatelessWidget {
  const SliverAppBarReservationDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 200.0,
      backgroundColor: ParkaColors.parkaGreen,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          margin: EdgeInsets.only(right: 8.0),
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: AutoSizeText(
                  "Nombre del parqueo",
                  maxLines: 1,
                  style: kParkaTextStyleBold16,
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  child: Row(
                    children: [
                      AutoSizeText(
                        '5.0',
                        maxLines: 1,
                        style: kParkaTextStyleBold16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        background: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://parka-api-bucket-aws.s3.amazonaws.com/parqueo2_b70eba08da.png"),
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: Offset(0, 140.0),
                  color: Colors.black54,
                  blurRadius: 18.0,
                  spreadRadius: 15.0,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
