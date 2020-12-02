import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class TimeTabWidget extends StatelessWidget {
  const TimeTabWidget({
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
            child: true != true
                ? Text(
                    "Empieza",
                    style: kParkaTextStyleBoldGreen18,
                  )
                : Text(
                    "Empezó",
                    style: kParkaTextStyleBoldGreen18,
                  )),
        Text(
          '11/13/2020 13:00 h',
          style: kParkaTextStyleBlack18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: true != true
              ? Text(
                  "Termina",
                  style: kParkaTextStyleBoldGreen18,
                )
              : Text(
                  "Termino",
                  style: kParkaTextStyleBoldGreen18,
                ),
        ),
        Text(
          '11/13/2020 15:00 h',
          style: kParkaTextStyleBlack18,
        )
      ],
    );
  }
}
