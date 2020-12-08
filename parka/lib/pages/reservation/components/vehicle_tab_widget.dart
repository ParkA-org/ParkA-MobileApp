import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/components/images/parka_add_images_carousel.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class VehicleTabWidget extends StatelessWidget {
  const VehicleTabWidget({
    Key key,
    @required Vehicle vehicle,
  })  : _vehicle = vehicle,
        super(key: key);

  // ignore: unused_field
  final Vehicle _vehicle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Vehiculo",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        Text(
          this._vehicle.alias,
          style: kParkaTextStyleBlack18,
        ),
        Container(
          height: this._vehicle.pictures.length == 0 ? 0 : 125,
          child: ParkaAddImagesCarousel(
            carouselType: CarouselType.Gallery,
            placeholderType: PlaceHolderType.Car,
            pictures: this._vehicle.pictures,
          ),
        ),
      ],
    );
  }
}
