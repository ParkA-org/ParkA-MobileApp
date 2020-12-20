import 'package:ParkA/components/map/position_viewer_card.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/styles/text.dart';
import "package:flutter/material.dart";
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PositionTabWidget extends StatelessWidget {
  const PositionTabWidget({
    Key key,
    @required marker,
    @required String parkingId,
    @required Parking parking,
  })  : _parkingId = parkingId,
        _parking = parking,
        _marker = marker,
        super(key: key);

  final String _parkingId;
  final Parking _parking;
  final _marker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Posicion",
              style: kParkaTextStyleBoldGreen18,
            ),
          ),
          PositionViewerWidget(
            parkingId: this._parkingId,
            markerIcon: this._marker,
            position: LatLng(
              this._parking.latitude,
              this._parking.longitude,
            ),
          ),
        ],
      ),
    );
  }
}
