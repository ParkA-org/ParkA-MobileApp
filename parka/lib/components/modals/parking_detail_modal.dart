import 'package:ParkA/components/rating/star_rating.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/pages/parking-detail/parking_detail_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParkingDetailModal extends StatelessWidget {
  final Parking parking;

  ParkingDetailModal({Key key, @required this.parking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${parking.parkingName}",
                  overflow: TextOverflow.clip,
                  style: kParkaTextStyleGrey.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  StarRating(rating: parking.rating.toInt()),
                  Text("(${parking.rating})",
                      style: kParkaTextStyleGrey.copyWith(
                          color: ParkaColors.parkaGreen))
                ],
              ),
              ShowParkingFeaturesWidget(features: parking.features),
              Divider(
                thickness: 1.0,
                color: Color(0xFF949494),
              ),
              SizedBox(
                height: 40,
              ),
              Divider(
                thickness: 1.0,
                color: Color(0xFF949494),
              ),
              Text(r"150 RD$ Hora",
                  style: kParkaTextStyleGrey.copyWith(
                      color: ParkaColors.parkaGreen,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15.0),
                      )),
                ],
              )
            ]),
      ),
    );
  }
}
