import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/pages/reservation/reservation-as-owner-detail/reservation_as_owner.dart';
import 'package:ParkA/pages/reservation/reservations-as-client-detail/reservation_as_client.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservationTile extends StatelessWidget {
  final Reservation reservation;

  final String type;

  const ReservationTile(
      {Key key, @required this.reservation, @required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String reservationDate = DateFormat("dd MMM, yyyy")
        .format(DateFormat("yyyy-MM-dd").parse(reservation.rentDate));
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        type == "Owner"
            ? ReservationAsOwnerPage(reservationId: reservation.id)
            : ReservationAsClientPage(reservationId: reservation.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(8),
                      height: 125,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 5.0),
                              color: Colors.black38,
                              blurRadius: 3.0,
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${reservation.parking.mainPicture}")))),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "${reservation.parking.parkingName}",
                          style: kParkaTextBaseStyle.copyWith(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 18,
                          maxFontSize: 22,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          "Fecha",
                          style: kParkaTextBaseStyle.copyWith(
                              color: ParkaColors.parkaGreen,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$reservationDate",
                          style: kParkaTextBaseStyle.copyWith(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Total",
                          style: kParkaTextBaseStyle.copyWith(
                              color: ParkaColors.parkaGreen,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " ${reservation.total} RD" r"$",
                          style: kParkaTextBaseStyle.copyWith(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0.0, 6.0),
                              color: Colors.black38,
                              blurRadius: 2.0,
                            )
                          ],
                          image: DecorationImage(
                              image: NetworkImage(type == "Owner"
                                  ? "${reservation.client.profilePicture}"
                                  : "${reservation.owner.profilePicture}"))),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: AutoSizeText(
                    type == "Owner"
                        ? "${reservation.client.name}"
                        : "${reservation.owner.name}",
                    style: kParkaTextBaseStyle.copyWith(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                    minFontSize: 18,
                    maxFontSize: 22,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1.0,
              color: Color(0xFF949494),
            ),
          ],
        )),
      ),
    );
  }
}
