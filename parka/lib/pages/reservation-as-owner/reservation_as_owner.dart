import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/images/parka_add_images_carousel.dart';
import 'package:ParkA/components/map/position_viewer_card.dart';
import 'package:ParkA/data/data-models/calendar/calendar_data_model.dart';
import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/reservation/reservation_data_model.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/data/use-cases/reservation/reservation_use_cases.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/functions/get_feature_icon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  @override
  void initState() {
    super.initState();
    this._loading = true;
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
                    expandedHeight: 250.0,
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
                                offset: Offset(0, 190.0),
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
                              ParkingPriceWidgetTab(parking: _parking),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
      )),
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

class WeekScheduleViewerWidget extends StatelessWidget {
  const WeekScheduleViewerWidget({
    Key key,
    @required Calendar calendar,
  })  : _calendar = calendar,
        super(key: key);

  final Calendar _calendar;

  List<Widget> _viewBuilder() {
    List<Widget> ret = new List();

    weekDaysList.forEach((element) {
      WeekDay _weekDay = weekDays[element];
      List _schedules = this._calendar.getDaySchedule(_weekDay);

      ret.add(
        Expanded(
          child: Container(
            child: Text(
              element.substring(0, 2).capitalizeFirst,
              style: _schedules.length == 0
                  ? kParkaBigButtonTextStyleGreen20
                  : kParkaTextStyleBoldWhite20,
            ),
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _schedules.length == 0
                  ? Colors.white
                  : ParkaColors.parkaGreen,
              border: Border.all(
                color: ParkaColors.parkaGreen,
                width: 2.0,
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Calendario",
            style: kParkaTextStyleBoldGreen18,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: this._viewBuilder(),
        )
      ],
    );
  }
}

class ShowParkingFeaturesWidget extends StatelessWidget {
  final List<Feature> features;

  const ShowParkingFeaturesWidget({
    Key key,
    @required this.features,
  }) : super(key: key);

  List<Widget> _viewBuilder() {
    List<Widget> ret = List();

    this.features.forEach((_feature) {
      ret.addAll([
        SvgPicture.asset(
          getFeatureIcon(
            _feature.name,
          ),
          color: ParkaColors.parkaGreen,
          height: 40.0,
          width: 40.0,
        ),
        SizedBox(
          width: 8.0,
        ),
      ]);
    });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return this.features.length == 0
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Caracteristicas",
                  style: kParkaTextStyleBoldGreen18,
                ),
              ),
              Container(
                height: 50.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: this._viewBuilder(),
                ),
              )
            ],
          );
  }
}
