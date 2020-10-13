import 'package:ParkA/components/Headers/parka_header.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/data_models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/pages/CreateVehiclePage/create_vehicle_page.dart';
import 'package:ParkA/pages/VehiclePage/components/user_vehicle_placeholder.dart';
import 'package:ParkA/pages/VehiclePage/components/user_vehicle_tile.dart';
import 'package:ParkA/use-cases/vehicle/vehicle_use_cases.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../components/Utils/parkaIcons.dart';

class VehiclePage extends StatefulWidget {
  static const String routeName = "/user-vehicles";

  @override
  __VehiclePageState createState() => __VehiclePageState();
}

class __VehiclePageState extends State<VehiclePage> {
  bool vehiclesLoaded;
  List<Vehicle> userVehicles;

  Future getAllUserVehicle() async {
    this.userVehicles = await VehicleUseCases.getAllUserVehicles();
    print(this.userVehicles.length);
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
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        backgroundColor: Color(0xFF086174),
        child: Icon(
          Icons.add,
          size: 40,
        ),
        highlightElevation: 20,
        // TO IMPLEMENT CREATE MY VEHICLE
        onPressed: () {
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
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: this.vehiclesLoaded
                  ? ListView(
                      children: vehicleListBuilder(),
                    )
                  : VehicleListPlaceHolder(),
            )
          ],
        ),
      ),
    );
  }
}
