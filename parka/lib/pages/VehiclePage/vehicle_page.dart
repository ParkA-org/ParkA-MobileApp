import 'package:ParkA/components/Utils/styles/parka_colors.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../../components/Utils/parkaIcons.dart';

class VehicleListScreen extends StatefulWidget {
  static const String routeName = "/user-vehicles";

  @override
  __VehicleListScreenState createState() =>
      __VehicleListScreenState();
}

class __VehicleListScreenState extends State<VehicleListScreen> {
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
        backgroundColor: ParkaColors.parkaGreen,
        child: Icon(Icons.add),
        // TO IMPLEMENT CREATE MY VEHICLE
        onPressed: (){},
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
                alignment: Alignment.centerLeft,
                child: Icon(
                  ParkaIcons.parkaCar,
                  color: Colors.white,
                  size: 130.0,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: this.paymentsLoaded ? ListView() : Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
