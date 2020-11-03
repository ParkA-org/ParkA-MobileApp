import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/controllers/create-parking-form/create_parking_form_controller.dart';
import 'package:ParkA/pages/create-parking/components/stepper_widget.dart';
import 'package:ParkA/pages/create-parking/steps/parking_calendar_creator_page.dart';
import 'package:ParkA/pages/create-vehicle/components/parka-input/parka_input.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingPositionSelectorPage extends StatelessWidget {
  static String routeName = 'parking-position-selector-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: ParkaHeader(
                  color: Colors.white,
                  leading: TransparentButton(
                    label: "Atras",
                    buttonTextStyle: kParkaInputDefaultSyle,
                    color: Colors.white,
                    leadingIconData: Icons.keyboard_arrow_left,
                    onTapHandler: () {
                      Get.find<CreateParkingFormController>().decrement();
                      Get.back();
                    },
                  ),
                ),
                decoration: BoxDecoration(
                  color: ParkaColors.parkaGreen,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                    child: AutoSizeText(
                      "Donde esta tu parqueo?",
                      maxLines: 1,
                      style: kParkaPageTitleTextStyle,
                    ),
                  ),
                  PositionPickerWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 36.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      children: [
                        ParkaEditInput(
                          type: ParkaInputType.textField,
                          label: "Sector",
                        ),
                        ParkaEditInput(
                          type: ParkaInputType.textField,
                          label: "Direccion",
                        ),
                        ParkaEditInput(
                          type: ParkaInputType.textField,
                          label: "Posicion",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: ParkaStepperWidget(
                stepsNumber: 3,
                onTapHandler: () {
                  Get.find<CreateParkingFormController>().increment();
                  Get.toNamed(ParkingCalendarCreatorPage.routeName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PositionPickerWidget extends StatelessWidget {
  const PositionPickerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: LayoutBuilder(builder: (ctx, constr) {
        final double sideLength = constr.maxWidth > 350 ? 350 : constr.maxWidth;

        return ConstrainedBox(
          constraints: constr,
          child: Container(
            height: sideLength,
            width: sideLength,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(3.0, 10.0),
                  color: Colors.black38,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: GoogleMap(
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(18.487876, -69.9644807),
                  zoom: 15.5,
                ),
                onTap: (LatLng position) {
                  print("tapped");
                },
                gestureRecognizers: Set()
                  ..add(Factory<EagerGestureRecognizer>(
                      () => EagerGestureRecognizer())),
              ),
            ),
          ),
        );
      }),
    );
  }
}
