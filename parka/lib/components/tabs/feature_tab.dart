import 'package:ParkA/styles/parka_colors.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:ParkA/utils/functions/get_feature_icon.dart';
import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';

class FeatureTab extends StatelessWidget {
  final Feature feature;
  final bool selected;
  final Function onTapHanlder;

  FeatureTab({
    this.feature,
    this.selected,
    this.onTapHanlder,
  });

  @override
  Widget build(BuildContext context) {
    final backGroundColor =
        this.selected ? ParkaColors.parkaGreen : Color(0xFFE5E4E4);
    final itemsColor = this.selected ? Colors.white : ParkaColors.parkaGreen;

    return GestureDetector(
      onTap: () {
        this.onTapHanlder(this.selected);
      },
      child: Container(
        alignment: Alignment.center,
        child: LayoutBuilder(builder: (ctx, constr) {
          final tabSize = constr.maxWidth * 0.7;

          return Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: backGroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 7.0),
                  color: Colors.black38,
                  blurRadius: 5.0,
                ),
              ],
            ),
            height: tabSize,
            width: tabSize,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  getFeatureIcon(
                    this.feature.name,
                  ),
                  height: tabSize * 0.5,
                  width: tabSize * 0.5,
                  color: itemsColor,
                ),
                Text(
                  this.feature.name,
                  style: TextStyle(
                    color: itemsColor,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
