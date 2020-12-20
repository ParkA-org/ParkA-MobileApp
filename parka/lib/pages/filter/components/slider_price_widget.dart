import 'package:ParkA/styles/parka_colors.dart';
import "package:flutter/material.dart";

class PriceSliderWidget extends StatelessWidget {
  const PriceSliderWidget({
    Key key,
    @required this.rangeFilter,
    @required this.sliderChangeHandler,
    @required this.maxSliderValue,
    @required this.minSliderValue,
  }) : super(key: key);

  final RangeValues rangeFilter;
  final Function sliderChangeHandler;
  final double minSliderValue;
  final double maxSliderValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Precio",
                style: TextStyle(
                  color: ParkaColors.parkaGreen,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                activeTrackColor: Color(0xFF0B768C),
                thumbColor: Color(0xFF0B768C),
              ),
              child: RangeSlider(
                divisions: (this.maxSliderValue / this.minSliderValue).floor(),
                values: this.rangeFilter,
                min: this.minSliderValue,
                max: this.maxSliderValue,
                labels: RangeLabels(
                  this.rangeFilter.start.round().toString(),
                  this.rangeFilter.end.round().toString(),
                ),
                onChanged: (RangeValues value) {
                  this.sliderChangeHandler(value);
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${this.minSliderValue.toInt()}\$",
                  style: TextStyle(
                    color: Color(0xFF0B768C),
                  ),
                ),
                Text("${this.maxSliderValue.toInt()}\$",
                    style: TextStyle(
                      color: Color(0xFF0B768C),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
