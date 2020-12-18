import 'dart:io';

import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'image_page.dart';

class ParkaImageCardWidget extends StatelessWidget {
  final PlaceHolderType type;
  final Function onTapHandler;
  final Function onLongPressHandler;
  final String image;
  final int index;

  ParkaImageCardWidget({
    Key key,
    this.index,
    this.onTapHandler,
    this.onLongPressHandler,
    this.image,
    @required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      onLongPress: () {
        if (this.image != null) {
          this.onLongPressHandler(index);
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, constraint) {
            const creditCardProp = 1.58;

            final referenceDimension = constraint.maxWidth == double.infinity ||
                    constraint.maxWidth > 350
                ? constraint.maxHeight * creditCardProp
                : constraint.maxWidth * creditCardProp;

            double cardWidth =
                referenceDimension > 350 ? 350 : referenceDimension;

            return ConstrainedBox(
              constraints: constraint,
              child: Container(
                width: cardWidth,
                height: cardWidth / creditCardProp,
                decoration: BoxDecoration(
                  color: ParkaColors.parkaInputGrey,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(3.0, 10.0),
                      color: Colors.black38,
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: this.image != null
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ImagePage(this.image);
                              },
                            ),
                          );
                        },
                        child: Hero(
                          tag: this.image,
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: GetUtils.isURL(this.image)
                                  ? Image.network(
                                      this.image,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      File(this.image),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      )
                    : CarImagePlaceholder(
                        cardWidth: cardWidth,
                        type: this.type,
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
