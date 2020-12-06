import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/data/use-cases/reservation/reservation_use_cases.dart';
import 'package:ParkA/pages/reservation/components/parking_price_tab_widget.dart';
import 'package:ParkA/pages/reservation/components/profile_tab_widget.dart';
import 'package:ParkA/pages/reservation/components/review_dialog_widget.dart';
import 'package:ParkA/pages/reservation/components/sliver_app_bar_reservation_detail.dart';
import 'package:ParkA/pages/reservation/components/time_tab_widget.dart';
import 'package:ParkA/pages/reservation/components/vehicle_tab_widget.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ReservationAsClientPage extends StatefulWidget {
  static String routeName = "reservation-as-client-page";

  final String reservationId;

  ReservationAsClientPage({
    @required this.reservationId,
  });

  @override
  _ReservationAsClientPageState createState() =>
      _ReservationAsClientPageState();
}

class _ReservationAsClientPageState extends State<ReservationAsClientPage> {
  String _reservationId;
  Reservation _reservation;
  bool _loading;
  Parking a = new Parking(priceHours: 100);

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
    print("llegue aca");
    print(this._reservation);
    if (this._reservation != null) {
      this._loading = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: this._loading != true
          ? ActionButtonsOwnerState(
              screenSize: screenSize,
              reservation: this._reservation,
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
                      SliverAppBarReservationDetail(),
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
                                      user: this._reservation.owner,
                                      name: "Propietario"),
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
    @required this.screenSize,
    @required this.reservation,
  }) : super(key: key);

  final Reservation reservation;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.09,
      width: screenSize.width * 1,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: true != true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff077187),
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
                            horizontal: 20, vertical: 12.0),
                        child: AutoSizeText(
                          "Editar Reserva",
                          maxLines: 1,
                          maxFontSize: 26,
                          minFontSize: 18,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {},
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
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 12.0),
                            child: AutoSizeText(
                              "Cancelar",
                              maxLines: 1,
                              maxFontSize: 26,
                              minFontSize: 18,
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
                ],
              )
            : Center(
                child: true != false
                    ? InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return ReviewDialog(
                                  reservation: this.reservation,
                                );
                              });
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
                                horizontal: 60, vertical: 10.0),
                            child: AutoSizeText(
                              "Calificar",
                              maxLines: 1,
                              maxFontSize: 30,
                              minFontSize: 30,
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    : true != true
                        ? InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff077187),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.transparent.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 6), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 10.0),
                                child: AutoSizeText(
                                  "Editar Calificación",
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
                          )
                        : InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff077187),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.transparent.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 6), // changes position of shadow
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
