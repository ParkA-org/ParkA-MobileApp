import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/images/parka_add_images_carousel.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/data/use-cases/vehicle/vehicle_use_cases.dart';
import 'package:ParkA/pages/edit-vehicle/edit_vehicle_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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

    getVehicle();
  }

  Future getVehicle() async {
    // TODO: use get parking by id use case
    this._parking = Parking();
    this._loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.edit,
        onPressedHandler: () {
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
