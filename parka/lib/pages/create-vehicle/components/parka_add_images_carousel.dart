import 'package:ParkA/pages/create-vehicle/components/parka_image_card_widget.dart';
import "package:flutter/material.dart";

class ParkaAddImagesCarousel extends StatelessWidget {
  final List<String> pictures;
  final Function onTapHandler;
  final Function onLongPressHandler;

  const ParkaAddImagesCarousel({
    Key key,
    this.pictures,
    this.onTapHandler,
    this.onLongPressHandler,
  }) : super(key: key);

  List<Widget> carouselBuilder() {
    List<Widget> ret = new List();

    int index = 0;
    this.pictures.forEach((element) {
      ret.add(
        ParkaImageCardWidget(
          image: element,
          index: index,
          onLongPressHandler: this.onLongPressHandler,
        ),
      );
      ret.add(
        SizedBox(
          width: 16.0,
        ),
      );
      index++;
    });

    ret.add(
      ParkaImageCardWidget(
        onTapHandler: this.onTapHandler,
      ),
    );

    ret.add(
      SizedBox(
        width: 16.0,
      ),
    );

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, constraints) {
        // print(constraints.maxWidth - 32.0);

        double cardWidth = constraints.maxWidth - 32.0 > 350
            ? 350
            : constraints.maxWidth - 32.0;
        const creditCardProp = 1.58;

        return ConstrainedBox(
          constraints: constraints,
          child: Container(
            height: (cardWidth + 32.0) / creditCardProp,
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
