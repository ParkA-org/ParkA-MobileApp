import 'package:ParkA/components/Rating/star_rating.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParkingDetailModal extends StatefulWidget {
  final String parkingId;

  ParkingDetailModal({Key key, @required this.parkingId}) : super(key: key);

  @override
  _ParkingDetailModalState createState() => _ParkingDetailModalState();
}

class _ParkingDetailModalState extends State<ParkingDetailModal> {
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
              Text("Calle Puerto Rico #175",
                  style: kParkaTextStyleGrey.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              StarRating(rating: 4),
              Text("Disponible",
                  style: kParkaTextStyleGrey.copyWith(
                      color: ParkaColors.parkaGreen,
                      fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.directions_car,
                    color: Color(0xFFA6A6A6),
                  ),
                  Text(
                    "13 Mins",
                    style: kParkaTextBaseStyle.copyWith(
                        fontSize: 16, color: Colors.grey[800]),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  SvgPicture.asset(
                    "resources/images/car.svg",
                    height: 30,
                  ),
                  SvgPicture.asset(
                    "resources/images/cctv4.svg",
                    height: 30,
                  ),
                ],
              ),
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
