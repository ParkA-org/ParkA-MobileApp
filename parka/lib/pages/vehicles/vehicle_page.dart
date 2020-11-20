import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';

import 'package:ParkA/data/use-cases/vehicle/vehicle_use_cases.dart';
import 'package:ParkA/pages/create-vehicle/components/parka_resizable_on_scroll_app_bar.dart';
import 'package:ParkA/pages/create-vehicle/create_vehicle_page.dart';
import 'package:ParkA/pages/vehicle-detail/vehicle_detail_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/parkaIcons.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'components/user_vehicle_placeholder.dart';
import 'components/user_vehicle_tile.dart';

class VehiclePage extends StatefulWidget {
  static const String routeName = "/user-vehicles";

  @override
  __VehiclePageState createState() => __VehiclePageState();
}

class __VehiclePageState extends State<VehiclePage> {
  bool _loading;
  List<Vehicle> userVehicles = [];

  Future<void> getAllUserVehicle() async {
    this.userVehicles = await VehicleUseCases.getAllUserVehicles();

    setState(() {
      this._loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this._loading = true;
    this.getAllUserVehicle();
  }

  List<Widget> vehicleListBuilder() {
    List<Widget> ret = new List();

    this.userVehicles.forEach((element) {
      ret.add(VehicleTile(
        vehicle: element,
        onTapHandler: () {
          Get.to(
            VehicleDetailPage(
              vehicleId: element.id,
            ),
          );
        },
      ));
    });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.add,
        onPressedHandler: () {
          Get.toNamed(CreateVehiclePage.routeName);
        },
      ),
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: this._loading,
          opacity: 0.5,
          child: RefreshIndicator(
            onRefresh: this.getAllUserVehicle,
            child: CustomScrollView(
              slivers: [
                ParkaResizableOnScrollAppBar(
                  title: "Tus Vehiculos",
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      !this._loading && this.userVehicles.length != 0
                          ? Column(
                              children: vehicleListBuilder(),
                            )
                          : VehicleListPlaceHolder()
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
