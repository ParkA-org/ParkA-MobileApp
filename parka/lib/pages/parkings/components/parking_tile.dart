import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ParkingTile extends StatelessWidget {
  const ParkingTile({
    Key key,
    this.parking,
    this.onTapHandler,
    this.screenSize,
  }) : super(key: key);
  final Parking parking;
  final Function onTapHandler;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: this.screenSize.height * 0.15,
                    width: this.screenSize.width * 0.50,
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
                  Container(
                    width: this.screenSize.width * 0.40,
                    height: this.screenSize.height * 0.15,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "Precio por hora:",
                            maxFontSize: 24,
                            minFontSize: 18,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kParkaTextBaseStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AutoSizeText(
                            "${this.parking.priceHours}",
                            maxFontSize: 24,
                            minFontSize: 18,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kParkaTextBaseStyle.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AutoSizeText(
                            "Status:",
                            maxFontSize: 24,
                            minFontSize: 18,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kParkaTextBaseStyle.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          this.parking.isAvailable
                              ? AutoSizeText(
                                  "Disponible",
                                  maxFontSize: 24,
                                  minFontSize: 18,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: kParkaTextBaseStyle.copyWith(
                                    color: Colors.green[600],
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : AutoSizeText(
                                  "Ocupado",
                                  maxFontSize: 24,
                                  minFontSize: 18,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: kParkaTextBaseStyle.copyWith(
                                    color: Colors.red[600],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          AutoSizeText(
                            "${this.parking.information}",
                            maxFontSize: 24,
                            minFontSize: 12,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: kParkaTextBaseStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Row(
                        children: [
                          AutoSizeText(
                            "Nombre: ",
                            maxFontSize: 24,
                            minFontSize: 22,
                            style: kParkaTextBaseStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        "${parking.parkingName}",
                        maxFontSize: 24,
                        minFontSize: 22,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kParkaTextBaseStyle.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Row(
                        children: [
                          Text(
                            "${parking.rating}",
                            style: kParkaTextBaseStyle.copyWith(
                              fontSize: 24,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: ParkaColors.parkaGreen,
                            size: 30.0,
                          )
                        ],
                      ),
                    ),
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
