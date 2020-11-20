import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/images/parka_add_images_carousel.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/data/use-cases/vehicle/vehicle_use_cases.dart';
import 'package:ParkA/pages/edit-vehicle/edit_vehicle_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleDetailPage extends StatefulWidget {
  static String routeName = "vehicle-detail-page";

  final String vehicleId;

  VehicleDetailPage({
    @required this.vehicleId,
  });

  @override
  _VehicleDetailPageState createState() => _VehicleDetailPageState();
}

class _VehicleDetailPageState extends State<VehicleDetailPage> {
  String _vehicleId;
  Vehicle _vehicle;
  bool _loading;

  @override
  void initState() {
    super.initState();
    this._loading = true;
    this._vehicleId = this.widget.vehicleId;

    getVehicle();
  }

  Future getVehicle() async {
    this._vehicle = await VehicleUseCases.getVehicleById(this._vehicleId);
    this._loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.edit,
        onPressedHandler: () {
          Get.to(
            EditVehiclePage(
              vehicle: this._vehicle,
            ),
          );
        },
      ),
      body: SafeArea(
        child: this._loading
            ? Container()
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 250.0,
                    backgroundColor: ParkaColors.parkaGreen,
                    flexibleSpace: FlexibleSpaceBar(
                      title: AutoSizeText(
                        this._vehicle.alias,
                        maxLines: 1,
                      ),
                      background: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(_vehicle.mainPicture),
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
                                height: 150,
                                child: ParkaAddImagesCarousel(
                                  type: PlaceHolderType.Car,
                                  pictures: this._vehicle.pictures,
                                ),
                              ),
                              VehicleDataTabWidget(
                                labelLeft: "Año",
                                labelRight: "Estatus",
                                valueLeft: this._vehicle.year.toString(),
                                valueRight: this._vehicle.verified
                                    ? "Verificado"
                                    : "No Verificado",
                              ),
                              VehicleDataTabWidget(
                                labelLeft: "Marca",
                                labelRight: "Modelo",
                                valueLeft: this._vehicle.year.toString(),
                                valueRight: this._vehicle.model.name,
                              ),
                              VehicleDataTabWidget(
                                labelLeft: "Tipo",
                                labelRight: "Placa",
                                valueLeft: this._vehicle.bodyStyle.name,
                                valueRight:
                                    this._vehicle.licensePlate.toUpperCase(),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   height: 10000,
                        //   width: 100,
                        // )
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}

class VehicleDataTabWidget extends StatelessWidget {
  final String labelLeft;
  final String valueLeft;
  final String labelRight;
  final String valueRight;

  const VehicleDataTabWidget({
    Key key,
    this.labelLeft,
    this.labelRight,
    this.valueLeft,
    this.valueRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text(
                  this.labelLeft,
                  style: kParkaBigButtonTextStyleGreen,
                ),
              ),
              Text(
                this.valueLeft,
                style: kParkaBigButtonTextStyleBlack,
              ),
              Divider(
                color: ParkaColors.parkaGrey,
                // height: 10.0,
                thickness: 1.0,
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text(
                  this.labelRight,
                  style: kParkaBigButtonTextStyleGreen,
                ),
              ),
              AutoSizeText(
                this.valueRight,
                overflow: TextOverflow.ellipsis,
                style: kParkaBigButtonTextStyleBlack,
              ),
              Divider(
                color: ParkaColors.parkaGrey,
                // height: 10.0,
                thickness: 1.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}
