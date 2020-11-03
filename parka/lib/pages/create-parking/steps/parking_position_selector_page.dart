import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/controllers/create-parking-form/create_parking_form_controller.dart';
import 'package:ParkA/pages/create-parking/components/stepper_widget.dart';
import 'package:ParkA/pages/create-parking/steps/parking_calendar_creator_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
