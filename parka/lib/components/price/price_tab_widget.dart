import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class ParkingPriceWidgetTab extends StatelessWidget {
  const ParkingPriceWidgetTab({
    Key key,
    @required this.value,
    this.valueStyle,
    @required this.label,
    this.labelStyle,
  }) : super(key: key);

  final String label;
  final TextStyle labelStyle;
  final TextStyle valueStyle;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            this.label,
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        Text(
          this.value,
          style: this.valueStyle ?? kParkaTextStyleBlack18,
        )
      ],
    );
  }
}
