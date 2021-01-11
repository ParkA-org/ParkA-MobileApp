import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImagePage extends StatelessWidget {
  final String image;
  ImagePage(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Hero(
          tag: this.image, child: Center(child: Image.network(this.image))),
    );
  }
}

class CarImagePlaceholder extends StatelessWidget {
  final PlaceHolderType type;

  CarImagePlaceholder({
    Key key,
    @required this.cardWidth,
    @required this.type,
  }) : super(key: key);

  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          this.type == PlaceHolderType.Car
              ? "resources/images/carPlaceHolder.svg"
              : "resources/images/parkingPlaceHolder.svg",
          height: cardWidth / 6,
          width: cardWidth / 6,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: cardWidth / 6,
          ),
        ),
      ],
    );
  }
}
