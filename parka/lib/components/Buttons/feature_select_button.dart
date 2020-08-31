import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class FeatureSelectButton extends StatelessWidget {
  const FeatureSelectButton({
    Key key,
    @required this.label,
    @required this.renderAvaliableWidth,
    this.isSelected,
    this.index,
    this.iconName,
    this.onTapHandler,
  }) : super(key: key);

  final renderAvaliableWidth;
  final String label;
  final int index;
  final bool isSelected;
  final String iconName;
  final Function onTapHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTapHandler(this.label, this.index);
      },
      child: Container(
        decoration: BoxDecoration(
            color: this.isSelected ? Color(0xFF0B768C) : Color(0xFFE5E4E4),
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 7.0),
                color: Colors.black38,
                blurRadius: 5.0,
              ),
            ]),
        margin: EdgeInsets.all(8.0),
        height: renderAvaliableWidth / 3.5,
        width: renderAvaliableWidth / 3.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              "resources/images/features/${this.iconName}",
              color: this.isSelected ? Colors.white : Color(0xFF0B768C),
            ),
            Text(
              this.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: this.isSelected ? Colors.white : Color(0xFF0B768C),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
