import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/images/parka_add_images_carousel.dart';
import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/data/use-cases/vehicle/vehicle_use_cases.dart';
import 'package:ParkA/pages/edit-vehicle/edit_vehicle_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/functions/get_feature_icon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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

  @override
  void initState() {
    super.initState();
    this._loading = true;
    this._parkingId = this.widget.parkingId;

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
          //TODO: ADD route to edit parking
          // Get.to(
          // );
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
                      title: AutoSizeText(
                        this._parking.parkingName,
                        maxLines: 1,
                      ),
                      background: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(_parking.mainPicture),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text("Precio por hora"),
                                  Text(
                                      '\$RD ${this._parking.perHourPrice}/Hora')
                                ],
                              ),
                              ShowParkingFeaturesWidget(
                                features: this._parking.features,
                              ),
                              WeekScheduleViewerWidget(parking: _parking),
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

class WeekScheduleViewerWidget extends StatelessWidget {
  const WeekScheduleViewerWidget({
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
        Text("Calendario"),
        Row(
          children: [],
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
      ret.add(
        SvgPicture.asset(
          getFeatureIcon(
            _feature.name,
          ),
          color: ParkaColors.parkaGreen,
          height: 50.0,
          width: 50.0,
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
        Text("Caracteristicas"),
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
