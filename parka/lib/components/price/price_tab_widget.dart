import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class ParkingPriceWidgetTab extends StatelessWidget {
  const ParkingPriceWidgetTab({
    Key key,
    @required Parking parking,
  })  : _parking = parking,
        super(key: key);

  final Parking _parking;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Precio por hora",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        Text(
          '\$RD ${this._parking.perHourPrice}/Hora',
          style: kParkaTextStyleBlack18,
        )
      ],
    );
  }
}
