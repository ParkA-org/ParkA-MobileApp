import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/pages/create-parking/create_parking_page.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class ParkingPage extends StatefulWidget {
  static String routeName = 'parking-page';

  @override
  _ParkingPageState createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  bool parkingsLoaded;
  List<Parking> userParkings = [];

  Future<void> getAllUserParkings() async{
    this.userParkings = await ParkingUseCases.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.add,
        onPressedHandler: () {
          Get.toNamed(CreateParkingPage.routeName);
        },
      ),
      body: SafeArea(
        child: Center(
          child: Text("Aqui va el listado de parqueo"),
        ),
      ),
    );
  }
}
