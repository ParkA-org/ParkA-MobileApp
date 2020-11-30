import 'package:ParkA/components/images/parka_add_images_carousel.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/data/use-cases/reservation/reservation_use_cases.dart';
import 'package:ParkA/pages/profile/components/parka_circle_avatar_widget.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      floatingActionButton: Container(),
      body: SafeArea(
        child: ModalProgressHUD(
          color: ParkaColors.parkaGreen,
          inAsyncCall: this._loading,
          child: this._loading
              ? Container(
                  color: ParkaColors.parkaGreen,
                )
              : CustomScrollView(
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
                                  margin: EdgeInsets.symmetric(horizontal: 2.0),
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
                                ProfileWidgetTab(parking: a),
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
    );
  }
}

class ProfileWidgetTab extends StatelessWidget {
  const ProfileWidgetTab({
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
            "Cliente",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: ParkaCircleAvatarWidget(
                    imageUrl:
                        "https://parka-api-bucket-aws.s3.amazonaws.com/pp_857565fdc3.jfif",
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'David Bujosa',
                          style: kParkaTextStyleBlack18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Text(
                              '4.20 ',
                              style: kParkaTextStyleBlack18,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        true != true
            ? Container()
            : InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          "Contatar ",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Color(0xff077187),
                              fontSize: 17.0),
                        ),
                        Icon(
                          Icons.message,
                          color: Color(0xff077187),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ],
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
          child: Text(
            "Empieza",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        Text(
          '11/13/2020 13:00 h',
          style: kParkaTextStyleBlack18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Termina",
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
