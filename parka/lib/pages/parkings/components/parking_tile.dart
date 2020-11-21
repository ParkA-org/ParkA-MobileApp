import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ParkingTile extends StatelessWidget {
  const ParkingTile({
    Key key,
    this.parking,
  }) : super(key: key);
  final Parking parking;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Navigate to the Parking Detail
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 200,
                margin: EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 5.0),
                        color: Colors.black38,
                        blurRadius: 5.0,
                      )
                    ],
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("${parking.mainPicture}"))),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                child: Row(
                  children: [
                    AutoSizeText(
                      "${parking.parkingName}",
                      maxFontSize: 24,
                      minFontSize: 16,
                      style: kParkaTextBaseStyle.copyWith(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 15,
                    ),
                    Text("${parking.rating}",
                        style: kParkaTextBaseStyle.copyWith(
                          fontSize: 24,
                        )),
                    Spacer(),
                    Icon(
                      Icons.star,
                      color: ParkaColors.parkaGreen,
                      size: 30.0,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Divider(
                  color: Color(0xFFA9A5A5),
                  thickness: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
