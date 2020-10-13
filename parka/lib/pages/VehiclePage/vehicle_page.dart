import 'package:ParkA/components/Buttons/transparent_button.dart';
import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import 'package:ParkA/components/Utils/styles/text.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../../components/Utils/parkaIcons.dart';

class VehiclePage extends StatefulWidget {
  static const String routeName = "/user-vehicles";

  @override
  __VehiclePageState createState() => __VehiclePageState();
}

class __VehiclePageState extends State<VehiclePage> {
  // final graphqlClient = Get.find<GraphqlClientController>();
  bool vehiclesLoaded;
  List userVehicles;

  Future getAllUserVehicle() async {
    // this.userVehicles = await VehicleUseCases.getAllUserVehicles();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        backgroundColor: ParkaColors.parkaGreen,
        child: Icon(
          Icons.add,
          size: 40,
        ),
        // TO IMPLEMENT CREATE MY VEHICLE
        onPressed: () {},
        // onPressed: () {
        //   Get.toNamed(PaymentInfoScreen.routeName);
        // },
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
                    TransparentButton(
                      label: "Atras",
                      buttonTextStyle: kParkaInputDefaultSyle,
                      color: Colors.white,
                      leadingIconData: Icons.keyboard_arrow_left,
                      onTapHandler: () {
                        Navigator.pop(context);
                      },
                    ),
                    Icon(
                      ParkaIcons.parkaCar,
                      color: Colors.white,
                      size: 145.0,
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: this.vehiclesLoaded ? ListView() : Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
