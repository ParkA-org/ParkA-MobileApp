import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/data/data-models/review/review_data_model.dart';
import 'package:ParkA/data/use-cases/reservation/reservation_use_cases.dart';
import 'package:ParkA/data/use-cases/review/review_use_cases.dart';
import 'package:ParkA/pages/reservation/components/parking_price_tab_widget.dart';
import 'package:ParkA/pages/reservation/components/profile_tab_widget.dart';
import 'package:ParkA/pages/reservation/components/show_review_dialog_widget.dart';
import 'package:ParkA/pages/reservation/components/sliver_app_bar_reservation_detail.dart';
import 'package:ParkA/pages/reservation/components/time_tab_widget.dart';
import 'package:ParkA/pages/reservation/components/vehicle_tab_widget.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ReservationAsOwnerPage extends StatefulWidget {
  static String routeName = "reservation-as-owner-page";
  final String reservationId;

  ReservationAsOwnerPage({
    @required this.reservationId,
  });

  @override
  _ReservationAsOwnerPageState createState() => _ReservationAsOwnerPageState();
}

class _ReservationAsOwnerPageState extends State<ReservationAsOwnerPage> {
  String _reservationId;
  Reservation _reservation;
  bool _loading;
  Review review;

  @override
  void initState() {
    super.initState();
    this._loading = true;
    this._reservationId = this.widget.reservationId;

    getReservation();
  }

  Future getReservation() async {
    this._reservation =
        await ReservationUseCases.getReservationById(this._reservationId);
    if (this._reservation != null) {
      this._loading = false;
    }

    setState(() {});
  }

  Future getReview() async {
    this.review =
        await ReviewUseCases.getReviewByReservation(this._reservationId);
    showDialog(
        context: context,
        builder: (context) {
          return ShowReview(
            reservation: this._reservation,
            review: review,
          );
        });
    setState(() {});
  }

  Future<void> cancelReservation() async {
    bool result =
        await ReservationUseCases.cancelReservation(this._reservationId);
    if (result != null) {
      return Navigator.pop(
        context,
      );
    } else {
      print("Something happened");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: !this._loading
          ? ActionButtonsOwnerState(
              getRewiew: this.getReview,
              reservation: this._reservation,
              screenSize: screenSize,
              handled: this.cancelReservation,
            )
          : Container(),
      body: SafeArea(
        child: ModalProgressHUD(
          color: ParkaColors.parkaGreen,
          inAsyncCall: this._loading,
          child: this._loading
              ? Container(
                  color: ParkaColors.parkaGreen,
                )
              : Container(
                  height: screenSize.height * 0.9,
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBarReservationDetail(
                        parking: this._reservation.parking,
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                24.0,
                                0,
                                24.0,
                                24.0,
                              ),
                              child: Column(
                                children: [
                                  ProfileTabWidget(
                                      user: this._reservation.client,
                                      name: "Cliente"),
                                  VehicleTabWidget(
                                      vehicle: this._reservation.vehicle),
                                  ParkingPriceTabWidget(
                                      parking: this._reservation.parking),
                                  TimeTabWidget(reservation: this._reservation),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class ActionButtonsOwnerState extends StatelessWidget {
  const ActionButtonsOwnerState({
    Key key,
    @required this.reservation,
    @required this.screenSize,
    @required this.handled,
    @required this.getRewiew,
  }) : super(key: key);

  final Reservation reservation;
  final Size screenSize;
  final Function handled;
  final Function getRewiew;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.09,
      width: screenSize.width * 1,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: this.reservation.status == "Created"
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                  onTap: () {
                    this.handled();
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF30F1D),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.transparent.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16.0),
                        child: AutoSizeText(
                          "Cancelar",
                          maxLines: 1,
                          maxFontSize: 30,
                          minFontSize: 24,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Center(
                child: !this.reservation.reviewed
                    ? Container()
                    : InkWell(
                        onTap: () {
                          this.getRewiew();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff077187),
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.transparent.withOpacity(0.2),
                                spreadRadius: 4,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 6), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10.0),
                            child: AutoSizeText(
                              "Mostrar Calificación",
                              maxLines: 1,
                              maxFontSize: 30,
                              minFontSize: 25,
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
      ),
    );
  }
}
