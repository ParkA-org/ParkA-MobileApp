import 'package:ParkA/components/images/parka_add_images_carousel.dart';
import 'package:ParkA/components/images/parka_image_card_widget.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";

class MiniVehicleListTile extends StatelessWidget {
  const MiniVehicleListTile({
    Key key,
    @required this.vehicle,
    this.onTapHandler,
  }) : super(key: key);

  final Vehicle vehicle;
  final Function onTapHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: this.vehicle == null
                      ? Container(
                          height: 60.0,
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            "Selecciona un vehiculo",
                            maxLines: 1,
                            style: kParkaTextStyleGrey18,
                          ),
                        )
                      : Container(
                          height: 100,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ParkaImageCardWidget(
                                    type: PlaceHolderType.Car,
                                    carouselType: CarouselType.Form,
                                    image: this.vehicle.mainPicture,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      AutoSizeText(
                                        this.vehicle.alias,
                                        maxLines: 1,
                                        style: kParkaTextStyleBoldGreen18,
                                      ),
                                      AutoSizeText(
                                        this.vehicle.model.make.name,
                                        maxLines: 1,
                                        style: kParkaTextStyleGreen14,
                                      ),
                                      AutoSizeText(
                                        this.vehicle.model.name,
                                        maxLines: 1,
                                        style: kParkaTextStyleGreen14,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
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
            ),
            Divider(
              thickness: 1.0,
              color: Color(0xFF949494),
            ),
          ],
        ),
      ),
    );
  }
}
