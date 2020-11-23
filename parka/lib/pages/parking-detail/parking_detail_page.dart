import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/images/parka_add_images_carousel.dart';
import 'package:ParkA/components/map/position_viewer_card.dart';
import 'package:ParkA/data/data-models/calendar/calendar_data_model.dart';
import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/pages/edit-parking/edit_parking_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/functions/get_feature_icon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class OwnerParkingDetailPage extends StatefulWidget {
  static String routeName = "owner-parking-detail-page";

  final String parkingId;

  OwnerParkingDetailPage({
    @required this.parkingId,
  });

  @override
  _OwnerParkingDetailPageState createState() => _OwnerParkingDetailPageState();
}

class _OwnerParkingDetailPageState extends State<OwnerParkingDetailPage> {
  String _parkingId;
  Parking _parking;
  bool _loading;
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    super.initState();
    this._loading = true;
    this._parkingId = this.widget.parkingId;

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'resources/images/green-parking-icon.png')
        .then((onValue) {
      _markerIcon = onValue;
    });

    getParking();
  }

  Future getParking() async {
    this._parking = await ParkingUseCases.getParkingById(this._parkingId);
    if (this._parking != null) {
      this._loading = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.edit,
        onPressedHandler: () {
          Get.to(EditParkingPage(
            parking: this._parking,
          ));
        },
      ),
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
                                this._parking.parkingName,
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
                                      '${this._parking.rating.toPrecision(2)}',
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
                            image: NetworkImage(_parking.mainPicture),
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
                                height: this._parking.pictures.length == 0
                                    ? 0
                                    : 125,
                                child: ParkaAddImagesCarousel(
                                  carouselType: CarouselType.Gallery,
                                  placeholderType: PlaceHolderType.Car,
                                  pictures: this._parking.pictures,
                                ),
                              ),
                              ParkingPriceWidgetTab(parking: _parking),
                              ShowParkingFeaturesWidget(
                                features: this._parking.features,
                              ),
                              WeekScheduleViewerWidget(
                                  calendar: this._parking.calendar),
                              PositionTabWidget(
                                marker: _markerIcon,
                                parkingId: _parkingId,
                                parking: _parking,
                              )
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
