import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:flutter/material.dart';

class ReservationTile extends StatelessWidget {
  final Reservation reservation;

  const ReservationTile({Key key, @required this.reservation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hola"),
    );
  }
}
