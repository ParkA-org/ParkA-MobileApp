import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class TimeTabWidget extends StatelessWidget {
  const TimeTabWidget({
    Key key,
    @required Reservation reservation,
  })  : _reservation = reservation,
        super(key: key);

  // ignore: unused_field
  final Reservation _reservation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: this._reservation.status != "Completed"
                ? Text(
                    "Empieza",
                    style: kParkaTextStyleBoldGreen18,
                  )
                : Text(
                    "Empezó",
                    style: kParkaTextStyleBoldGreen18,
                  )),
        Text(
          this._reservation.checkInDate.split("T")[0] +
              " " +
              this._reservation.checkInDate.split("T")[1].substring(0, 5),
          style: kParkaTextStyleBlack18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: this._reservation.status != "Created" &&
                  this._reservation.status != "IsProgress"
              ? Text(
                  "Termino",
                  style: kParkaTextStyleBoldGreen18,
                )
              : Text(
                  "Termina",
                  style: kParkaTextStyleBoldGreen18,
                ),
        ),
        Text(
          this._reservation.checkOutDate.split("T")[0] +
              " " +
              this._reservation.checkOutDate.split("T")[1].substring(0, 5),
          style: kParkaTextStyleBlack18,
        )
      ],
    );
  }
}
