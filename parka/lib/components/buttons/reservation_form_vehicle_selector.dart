import 'package:ParkA/components/cards/vehicle_mini_list_tile.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class VehicleSelectorWidget extends StatelessWidget {
  final Vehicle vehicle;
  final Function onTapHandler;

  const VehicleSelectorWidget({
    Key key,
    this.vehicle,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Vehicle",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        MiniVehicleListTile(
          vehicle: this.vehicle,
          onTapHandler: this.onTapHandler,
        )
      ],
    );
  }
}
