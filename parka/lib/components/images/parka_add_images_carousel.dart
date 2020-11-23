import 'package:ParkA/components/images/parka_image_card_widget.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import "package:flutter/material.dart";

enum CarouselType {
  Form,
  Gallery,
}

class ParkaAddImagesCarousel extends StatelessWidget {
  final CarouselType carouselType;
  final PlaceHolderType placeholderType;
  final List<String> pictures;
  final Function onTapHandler;
  final Function onLongPressHandler;

  const ParkaAddImagesCarousel({
    Key key,
    this.pictures,
    this.onTapHandler,
    this.onLongPressHandler,
    @required this.carouselType,
    @required this.placeholderType,
  }) : super(key: key);

  List<Widget> carouselBuilder() {
    List<Widget> ret = new List();

    int index = 0;
    this.pictures.forEach((element) {
      ret.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: ParkaImageCardWidget(
            image: element,
            index: index,
            type: this.placeholderType,
            onLongPressHandler: this.onLongPressHandler,
          ),
        ),
      );
      index++;
    });

    if (this.carouselType == CarouselType.Form) {
      print("SI SOY UN FORM");
      ret.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: ParkaImageCardWidget(
            type: this.placeholderType,
            onTapHandler: this.onTapHandler,
          ),
        ),
      );
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, constraints) {
        // print(constraints.maxWidth - 32.0);

        const creditCardProp = 1.58;

        final referenceDimension = constraints.maxWidth == double.infinity ||
                constraints.maxWidth > 350
            ? constraints.maxHeight * creditCardProp
            : constraints.maxWidth * creditCardProp;

        double cardWidth = referenceDimension > 350 ? 350 : referenceDimension;

        print(MediaQuery.of(context).size.width);
        print(cardWidth);

        return ConstrainedBox(
          constraints: constraints,
          child: this.pictures.length == 0 &&
                  this.carouselType == CarouselType.Form
              ? ParkaImageCardWidget(
                  type: this.placeholderType,
                  onTapHandler: this.onTapHandler,
                )
              : Container(
                  height: (cardWidth) / creditCardProp,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: carouselBuilder(),
                  ),
                ),
        );
      },
    );
  }
}
