import 'dart:io';

import 'package:ParkA/styles/parka_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ParkaImageCardWidget extends StatelessWidget {
  final Function onTapHandler;
  final String image;

  ParkaImageCardWidget({
    Key key,
    this.onTapHandler,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, constraint) {
            // print(constraint.maxWidth);

            double cardWidth =
                constraint.maxWidth > 350 ? 350 : constraint.maxWidth;
            const creditCardProp = 1.58;

            print(
              (cardWidth + 32.0) / creditCardProp,
            );

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
                  // image: DecorationImage(
                  //   fit: BoxFit.fitHeight,
                  //   image: NetworkImage(
                  //       "https://st.motortrend.com/uploads/sites/5/2019/11/2020-Toyota-Corolla-Hybrid-LE-front-three-quarter-in-motion.jpg"),
                  // ),
                ),
                child: this.image != null
                    ? (GetUtils.isURL(this.image)
                        ? Container(
                            // padding: const EdgeInsets.all(16.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                "https://st.motortrend.com/uploads/sites/5/2019/11/2020-Toyota-Corolla-Hybrid-LE-front-three-quarter-in-motion.jpg",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          )
                        : Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.file(
                                File(this.image),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "resources/images/carPlaceHolder.svg",
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 40.0,
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
