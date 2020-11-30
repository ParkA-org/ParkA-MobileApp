import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/pages/create-parking/create_parking_page.dart';
import 'package:ParkA/pages/create-vehicle/components/parka_resizable_on_scroll_app_bar.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ReservationAsOwnerPage extends StatefulWidget {
  static String routeName = 'reservation-as-owner-page';

  @override
  _ReservationAsOwnerPageState createState() => _ReservationAsOwnerPageState();
}

class _ReservationAsOwnerPageState extends State<ReservationAsOwnerPage> {
  bool _loading;
  List<Parking> userParkings = [];

  Future<void> getAllUserParkings() async {
    this.userParkings = await ParkingUseCases.getAllUserParkings();

    setState(() {
      this._loading = false;
    });
  }

  // List<Widget> parkingListBuilder() {
  //   List<Widget> parkingList = new List();

  //   this.userParkings.forEach((parking) {
  //     parkingList.add(
  //       ParkingTile(
  //         parking: parking,
  //         onTapHandler: () => Get.to(
  //           OwnerParkingDetailPage(
  //             parkingId: parking.id,
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  //   return parkingList;
  // }

  @override
  void initState() {
    super.initState();
    this._loading = true;
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
        child: SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: this._loading,
            opacity: 0.5,
            child: RefreshIndicator(
              onRefresh: this.getAllUserParkings,
              child: CustomScrollView(
                slivers: [
                  ParkaResizableOnScrollAppBar(
                    title: "Tus Parqueos",
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        !this._loading && this.userParkings.length != 0
                            ? Column(
                                // children: parkingListBuilder(),
                                )
                            : Container()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
