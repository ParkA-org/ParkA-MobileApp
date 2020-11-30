import 'package:ParkA/components/images/parka_add_images_carousel.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/data/use-cases/reservation/reservation_use_cases.dart';
import 'package:ParkA/pages/reservation/components/profile_widget_tab.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  BitmapDescriptor _markerIcon;
  Parking a = new Parking(perHourPrice: 100);

  @override
  void initState() {
    super.initState();
    this._loading = false;
    this._reservationId = this.widget.reservationId;

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'resources/images/green-parking-icon.png')
        .then((onValue) {
      _markerIcon = onValue;
    });

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

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: ActionButtonsOwnerState(screenSize: screenSize),
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
                      SliverAppBar(
                        pinned: true,
                        expandedHeight: 200.0,
                        backgroundColor: ParkaColors.parkaGreen,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Container(
                            margin: EdgeInsets.only(right: 8.0),
                            padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    "Nombre del parqueo",
                                    maxLines: 1,
                                    style: kParkaTextStyleBold16,
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    child: Row(
                                      children: [
                                        AutoSizeText(
                                          '5.0',
                                          maxLines: 1,
                                          style: kParkaTextStyleBold16,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          background: Stack(
                            alignment: Alignment.center,
                            fit: StackFit.expand,
                            children: [
                              Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://parka-api-bucket-aws.s3.amazonaws.com/parqueo2_b70eba08da.png"),
                              ),
                              Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 140.0),
                                    color: Colors.black54,
                                    blurRadius: 18.0,
                                    spreadRadius: 15.0,
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
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
                                  ProfileWidgetTab(parking: a, name: "Owner"),
                                  VehicleWidgetTab(parking: a),
                                  ParkingPriceWidgetTab(parking: a),
                                  StartAndEndTimeWidgetTab(parking: a),
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
  }) : super(key: key);

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
                            horizontal: 40, vertical: 12.0),
                        child: AutoSizeText(
                          "Confirmar",
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
            : InkWell(
                onTap: () {},
                child: Center(
                  child: true != true
                      ? Container(
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
                        )
                      : true != true
                          ? Container(
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
                            )
                          : Container(
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

class VehicleWidgetTab extends StatelessWidget {
  const VehicleWidgetTab({
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
            "Vehiculo",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        Text(
          'Toyota Corolla',
          style: kParkaTextStyleBlack18,
        ),
        Container(
          height: 1 == 0 ? 0 : 125,
          child: ParkaAddImagesCarousel(
            carouselType: CarouselType.Gallery,
            placeholderType: PlaceHolderType.Car,
            pictures: [
              "https://parka-api-bucket-aws.s3.amazonaws.com/car3_8fa6a2b4bf.jpg",
              "https://parka-api-bucket-aws.s3.amazonaws.com/car1_1f989362b2.jpg",
              "https://parka-api-bucket-aws.s3.amazonaws.com/car21_b80e0af9ec.jpg"
            ],
          ),
        ),
      ],
    );
  }
}

class StartAndEndTimeWidgetTab extends StatelessWidget {
  const StartAndEndTimeWidgetTab({
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
