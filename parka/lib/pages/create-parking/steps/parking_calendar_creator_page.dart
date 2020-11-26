import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/components/inputs/parka_time_selector_widget/time_schedule_selector_widget.dart';
import 'package:ParkA/controllers/create-parking-form/create_parking_form_controller.dart';
import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';
import 'package:ParkA/pages/create-parking/components/stepper_widget.dart';
import 'package:ParkA/pages/create-parking/steps/parking_image_selector_page.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParkingCalendarCreatorPage extends StatelessWidget {
  static String routeName = 'calendar-creator-page';

  final CreateParkingFormController createParkingFormController =
      Get.find<CreateParkingFormController>();

  final Map<String, String> _weekDays = {
    'monday': "Lunes",
    'tuesday': "Martes",
    'wednesday': "Miercoles",
    'thursday': "Jueves",
    'friday': "Viernes",
    'saturday': "Sabado",
    'sunday': "Domingo",
  };

  List<Widget> _calendarBuilder() {
    List<Widget> ret = new List();

    for (var key in _weekDays.keys) {
      ret.add(
        Obx(
          () => TimeScheduleSelectorWidget(
            label: this._weekDays[key],
            schedules: createParkingFormController
                .createPArkingDto.value.calendar[key],
            onChange: (Schedule _schedule, int _index) {
              createParkingFormController.addSchedule(key, _schedule, _index);
            },
            onRemove: (int _index) {
              createParkingFormController.removeSchedule(key, _index);
            },
            onLabelTap: (bool _clear) {
              if (_clear) {
                createParkingFormController.clearSchedule(key);
              } else {
                createParkingFormController.set24hSchedule(key);
              }
            },
          ),
        ),
      );
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(
                            "Disponibilidad",
                            maxLines: 1,
                            style: kParkaPageTitleTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AutoSizeText(
                            "Selecciona los dias y las horas",
                            maxLines: 1,
                            style: kParkaTextBaseStyle.copyWith(fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: _calendarBuilder(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: ParkaStepperWidget(
                stepsNumber: 3,
                index: Get.find<CreateParkingFormController>().step.value,
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
