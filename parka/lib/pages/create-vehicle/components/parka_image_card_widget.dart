import 'dart:io';

import 'package:ParkA/styles/parka_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ParkaImageCardWidget extends StatelessWidget {
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

            final referenceDimension = constraint.maxWidth == double.infinity
                ? constraint.maxHeight
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
                    ? Container(
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
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "resources/images/carPlaceHolder.svg",
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
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
