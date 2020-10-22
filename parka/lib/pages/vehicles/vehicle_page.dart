import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';

import 'package:ParkA/data/use-cases/vehicle/vehicle_use_cases.dart';
import 'package:ParkA/pages/create-vehicle/create_vehicle_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/parkaIcons.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'components/user_vehicle_placeholder.dart';
import 'components/user_vehicle_tile.dart';

class VehiclePage extends StatefulWidget {
  static const String routeName = "/user-vehicles";

  @override
  __VehiclePageState createState() => __VehiclePageState();
}

class __VehiclePageState extends State<VehiclePage> {
  bool vehiclesLoaded;
  List<Vehicle> userVehicles = [];

  Future<void> getAllUserVehicle() async {
    this.userVehicles = await VehicleUseCases.getAllUserVehicles();

    setState(() {
      this.vehiclesLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    this.vehiclesLoaded = false;
    this.getAllUserVehicle();
  }

  List<Widget> vehicleListBuilder() {
    List<Widget> ret = new List();

    this.userVehicles.forEach((element) {
      ret.add(VehicleTile(
        vehicle: element,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: ParkaColors.parkaGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3.0, 7.0),
                        color: Colors.black38,
                        blurRadius: 5.0,
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ParkaHeader(
                      color: Colors.white,
                    ),
                    Icon(
                      ParkaIcons.parkaCar,
                      color: Colors.white,
                      size: 130.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        'Tus Vehiculos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: this.vehiclesLoaded && this.userVehicles.length != 0
                  ? RefreshIndicator(
                      onRefresh: this.getAllUserVehicle,
                      child: ListView(
                        children: vehicleListBuilder(),
                      ),
                    )
                  : VehicleListPlaceHolder(),
            )
          ],
        ),
      ),
    );
  }
}
