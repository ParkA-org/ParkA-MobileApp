import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/controllers/create-parking-form/create_parking_form_controller.dart';
import 'package:ParkA/data/data-models/calendar/calendar_data_model.dart';
import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';
import 'package:ParkA/pages/create-parking/components/parka_time_selector_widget.dart';
import 'package:ParkA/pages/create-parking/components/stepper_widget.dart';
import 'package:ParkA/pages/create-parking/steps/parking_image_selector_page.dart';
import 'package:ParkA/pages/create-parking/steps/parking_position_selector_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:get/get.dart';

class ParkingCalendarCreatorPage extends StatelessWidget {
  static String routeName = 'calendar-creator-page';

  final CreateParkingFormController createParkingFormController =
      Get.find<CreateParkingFormController>();

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
                shrinkWrap: true,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                    child: AutoSizeText(
                      "Cual es tu tu disponibilidad?",
                      maxLines: 1,
                      style: kParkaPageTitleTextStyle,
                    ),
                  ),
                  Obx(
                    () => TimeScheduleSelectorWidget(
                      label: "Lunes",
                      schedules: createParkingFormController
                          .createPArkingDto.value.calendar['monday'],
                      onChange: (Schedule _schedule, int _index) {
                        print("IM CHANGING");
                        createParkingFormController.addSchedule(
                            "monday", _schedule, _index);
                      },
                      onRemove: (int _index) {
                        createParkingFormController.removeSchedule(
                            "monday", _index);
                      },
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
                  Get.toNamed(ParkingImageSelectorPage.routeName);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimeScheduleSelectorWidget extends StatelessWidget {
  final String label;
  final List<Schedule> schedules;
  final Function onChange;
  final Function onRemove;

  const TimeScheduleSelectorWidget({
    Key key,
    @required this.label,
    @required this.schedules,
    this.onChange,
    this.onRemove,
  }) : super(key: key);

  List<Widget> selectorBuilder() {
    List<Widget> ret = new List();

    int i = 0;
    print(this.schedules);
    this.schedules.forEach((element) {
      ret.add(TimeSelectorWidget(
        showAddSign: i < 2 && this.schedules.length < 2,
        schedule: element,
        index: i,
        onChangeHadler: this.onChange,
        onRemoveHadler: this.onRemove,
      ));
      i++;
    });

    if (ret.length < 2) {
      print("ADDING");

      ret.add(TimeSelectorWidget(
        key: Key(ret.length.toString()),
        onChangeHadler: this.onChange,
        index: ret.length,
      ));
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 16.0,
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                margin: EdgeInsets.only(left: 24.0),
                // padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: ParkaColors.parkaLightGrey,
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 28.0),
                  child: Column(
                    children: this.selectorBuilder(),
                  ),
                ),
              ),
              Container(
                child: Text(
                  this.label.substring(0, 2),
                  style: kParkaBigButtonTextStyle,
                ),
                height: 50.0,
                width: 50.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ParkaColors.parkaGreen,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
