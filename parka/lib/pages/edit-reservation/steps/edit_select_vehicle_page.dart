import 'package:ParkA/components/cards/vehicle_mini_list_tile.dart';
import 'package:ParkA/controllers/create-reservation-form/create_reservation_controller.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/data/use-cases/vehicle/vehicle_use_cases.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditSelectVehiclePage extends StatefulWidget {
  static String routeName = "edit-select-vehicle-page";

  @override
  _EditSelectVehiclePageState createState() => _EditSelectVehiclePageState();
}

class _EditSelectVehiclePageState extends State<EditSelectVehiclePage> {
  CreateReservationFormController _formController =
      Get.find<CreateReservationFormController>();

  bool _loading;

  List<Vehicle> userVehicles;

  Future getAllUserPayment() async {
    this.userVehicles = await VehicleUseCases.getAllUserVehicles();

    setState(() {
      this._loading = false;
    });
  }

  List<Widget> buildListView() {
    List<Widget> ret = new List<Widget>();

    this.userVehicles.forEach((element) {
      ret.add(
        MiniVehicleListTile(
          vehicle: element,
          onTapHandler: () {
            _formController.setVehicle(element);
            Get.back();
          },
        ),
      );
    });

    return ret;
  }

  @override
  void initState() {
    super.initState();
    this._loading = true;

    this.getAllUserPayment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                                  this
                                      ._formController
                                      .createReservationDto
                                      .parking
                                      .parkingName,
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
                                        '${this._formController.createReservationDto.parking.rating.toStringAsPrecision(2)}',
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
                              image: NetworkImage(this
                                  ._formController
                                  .createReservationDto
                                  .parking
                                  .mainPicture),
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
                          Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 25.0,
                            ),
                            child: Text(
                              "Vehiculo",
                              style: kParkaTextStyleBoldGreen22,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: buildListView(),
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
