import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/pages/create-parking/create_parking_page.dart';
import 'package:ParkA/styles/parkaIcons.dart';
import 'package:ParkA/styles/parka_colors.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'components/parking_list_placeholder.dart';
import 'components/parking_tile.dart';

class ParkingPage extends StatefulWidget {
  static String routeName = 'parking-page';

  @override
  _ParkingPageState createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  bool parkingsLoaded;
  List<Parking> userParkings = [];

  Future<void> getAllUserParkings() async {
    this.userParkings = await ParkingUseCases.getAllUserParkings();

    setState(() {
      this.parkingsLoaded = true;
    });
  }

  List<Widget> parkingListBuilder() {
    List<Widget> parkingList = new List();

    this.userParkings.forEach((parking) {
      parkingList.add(ParkingTile(parking: parking));
    });
    return parkingList;
  }

  @override
  void initState() {
    super.initState();
    this.parkingsLoaded = false;
    this.getAllUserParkings();
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
                      'Tus Parqueos',
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
            child: this.parkingsLoaded && this.userParkings.length != 0
                ? RefreshIndicator(
                    onRefresh: this.getAllUserParkings,
                    child: ListView(
                      children: parkingListBuilder(),
                    ),
                  )
                : ParkingListPlaceholder(),
          )
        ],
      )),
    );
  }
}
