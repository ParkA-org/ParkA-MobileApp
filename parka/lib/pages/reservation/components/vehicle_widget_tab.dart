import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/components/images/parka_add_images_carousel.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class VehicleWidgetTab extends StatelessWidget {
  const VehicleWidgetTab({
    Key key,
    @required Parking parking,
  })  : _parking = parking,
        super(key: key);

  final Parking _parking;

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
          'Toyota Corolla',
          style: kParkaTextStyleBlack18,
        ),
        Container(
          height: 1 == 0 ? 0 : 125,
          child: ParkaAddImagesCarousel(
            carouselType: CarouselType.Gallery,
            placeholderType: PlaceHolderType.Car,
            pictures: [
              "https://parka-api-bucket-aws.s3.amazonaws.com/car3_8fa6a2b4bf.jpg",
              "https://parka-api-bucket-aws.s3.amazonaws.com/car1_1f989362b2.jpg",
              "https://parka-api-bucket-aws.s3.amazonaws.com/car21_b80e0af9ec.jpg"
            ],
          ),
        ),
      ],
    );
  }
}
