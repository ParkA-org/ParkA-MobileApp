import "package:flutter/material.dart";

class PriceSliderWidget extends StatelessWidget {
  const PriceSliderWidget({
    Key key,
    @required this.rentPriceFilter,
    @required this.sliderChangeHandler,
    @required this.maxSliderValue,
    @required this.minSliderValue,
  }) : super(key: key);

  final double rentPriceFilter;
  final Function sliderChangeHandler;
  final double minSliderValue;
  final double maxSliderValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "Precio",
              style: TextStyle(
                color: Color(0xFF0B768C),
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
            child: Slider(
              value: this.rentPriceFilter,
              min: this.minSliderValue,
              max: this.maxSliderValue,
              onChanged: (value) {
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
    );
  }
}
