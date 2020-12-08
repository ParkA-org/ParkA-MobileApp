import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/components/tabs/feature_tab.dart';
import 'package:ParkA/controllers/update-parking-form/update_parking_form_controller.dart';
import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/use-cases/feature/feature_use_cases.dart';
import 'package:ParkA/pages/create-parking/components/stepper_widget.dart';
import 'package:ParkA/pages/create-vehicle/components/parka-input/parka_input.dart';
import 'package:ParkA/pages/edit-parking/steps/edit_parking_calendar.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditParkingPage extends StatefulWidget {
  static String routeName = "/edit-parking-page";

  final Parking parking;

  EditParkingPage({@required this.parking});

  @override
  _EditParkingPageState createState() => _EditParkingPageState();
}

class _EditParkingPageState extends State<EditParkingPage> {
  Parking _parking;
  final UpdateParkingFormController _updateParkingController = Get.put(
    UpdateParkingFormController(),
  );

  List<Feature> features;
  bool _loadingData;

  void getFormData() async {
    this.features = await FeatureUseCases.getAllFeatures();

    setState(() {
      this._loadingData = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this._loadingData = true;
    this._parking = this.widget.parking;
    this._updateParkingController.initParkingDto(this._parking);
    this.getFormData();
  }

  List<Widget> featureListBuilder() {
    List<Widget> ret = new List();

    this.features.forEach((element) {
      bool check = _updateParkingController.updateParkingDto.features
              .indexOf(element.id) !=
          -1;

      ret.add(FeatureTab(
        feature: element,
        selected: check,
        onTapHanlder: (bool _selected) {
          if (!_selected)
            _updateParkingController.addFeature(element.id);
          else
            _updateParkingController.removeFeature(element.id);
        },
      ));
    });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          color: ParkaColors.parkaGreen,
          inAsyncCall: this._loadingData,
          child: this._loadingData
              ? Container()
              : Column(
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
                              if (Get.find<UpdateParkingFormController>()
                                      .step
                                      .value !=
                                  1) {
                                Get.find<UpdateParkingFormController>()
                                    .decrement();
                              }

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
                            padding: EdgeInsets.symmetric(
                              vertical: 24.0,
                              horizontal: 16.0,
                            ),
                            child: AutoSizeText(
                              "Hablanos sobre tu parqueo",
                              maxLines: 1,
                              style: kParkaPageTitleTextStyle,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 36.0),
                            child: Column(
                              children: [
                                ParkaEditInput(
                                  type: ParkaInputType.textField,
                                  label: "Nombre del parqueo",
                                  value: this._parking.parkingName,
                                  onChangedHandler: (String value) {
                                    _updateParkingController
                                        .setParkingName(value);
                                  },
                                ),
                                ParkaTextField(
                                  inputType: TextInputType.number,
                                  label: "Numero de parqueos",
                                  value: this._parking.parkingCount.toString(),
                                  onChangedHandler: (String number) {
                                    _updateParkingController
                                        .setParkingCount(int.tryParse(number));
                                  },
                                ),
                                ParkaTextField(
                                  inputType: TextInputType.number,
                                  label: "Precio por hora",
                                  value: this._parking.priceHours.toString(),
                                  onChangedHandler: (String numbers) {
                                    _updateParkingController.setParkingPrice(
                                        double.tryParse(numbers));
                                  },
                                ),
                                ParkaTextField(
                                  label: "Detalles adicionales",
                                  value: this._parking.information,
                                  onChangedHandler: (String value) {
                                    _updateParkingController
                                        .setParkingDetails(value);
                                  },
                                ),
                                Obx(
                                  () => ExpansionTile(
                                    title: Text(
                                      "Caracteristicas",
                                      style: TextStyle(
                                          color: Color(0xFF0B768C),
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    children: [
                                      GridView.count(
                                        crossAxisCount: 2,
                                        children: featureListBuilder(),
                                        shrinkWrap: true,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: ParkaStepperWidget(
                        stepsNumber: 2,
                        index:
                            Get.find<UpdateParkingFormController>().step.value,
                        onTapHandler: () {
                          Get.find<UpdateParkingFormController>().increment();
                          Get.toNamed(ParkingCalendarEditorPage.routeName);
                        },
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
