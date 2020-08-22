import "package:flutter/material.dart";

class PriceSliderWidget extends StatelessWidget {
  const PriceSliderWidget({
    Key key,
    @required this.rentPriceFilter,
    @required this.sliderChangeHandler,
  }) : super(key: key);

  final double rentPriceFilter;
  final Function sliderChangeHandler;

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
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Slider(
            value: this.rentPriceFilter,
            min: 50.0,
            max: 1000.0,
            onChanged: (value) {
              this.sliderChangeHandler(value);
            },
          ),
        ),
      ],
    );
  }
}
