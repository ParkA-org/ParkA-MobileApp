import 'package:ParkA/components/buttons/transparent_button.dart';
import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/controllers/create-parking-form/create_parking_form_controller.dart';
import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';
import 'package:ParkA/data/use-cases/feature/feature_use_cases.dart';
import 'package:ParkA/pages/create-parking/steps/parking_position_selector_page.dart';
import 'package:ParkA/pages/create-vehicle/components/parka-input/parka_input.dart';

import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/functions/get_feature_icon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'components/stepper_widget.dart';

class CreateParkingPage extends StatefulWidget {
  static String routeName = 'create-parking-page';

  @override
  _CreateParkingPageState createState() => _CreateParkingPageState();
}

class _CreateParkingPageState extends State<CreateParkingPage> {
  final createParkingFormController = Get.put(CreateParkingFormController());

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
    getFormData();
  }

  List<Widget> featureGridBuilder() {
    List<Widget> ret = new List();

    this.features.forEach((element) {
      bool check = createParkingFormController.createPArkingDto.value.features
              .indexOf(element.id) !=
          -1;

      ret.add(FeatureTab(
        feature: element,
        selected: check,
        onTapHanlder: (bool _selected) {
          if (!_selected)
            createParkingFormController.addFeature(element.id);
          else
            createParkingFormController.removeFeature(element.id);
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
                              Get.find<CreateParkingFormController>()
                                  .decrement();
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
                                  onChangedHandler: (String value) {
                                    createParkingFormController
                                        .setParkingName(value);
                                  },
                                ),
                                ParkaTextField(
                                  inputType: TextInputType.number,
                                  label: "Numero de parqueos",
                                  onChangedHandler: (String number) {
                                    createParkingFormController
                                        .setParkingCount(int.tryParse(number));
                                  },
                                ),
                                ParkaTextField(
                                  inputType: TextInputType.number,
                                  label: "Precio por hora",
                                  onChangedHandler: (String numbers) {
                                    createParkingFormController.setParkingPrice(
                                        double.tryParse(numbers));
                                  },
                                ),
                                ParkaTextField(
                                  label: "Detalles adicionales",
                                  onChangedHandler: (String value) {
                                    createParkingFormController
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
                                    children: featureGridBuilder(),
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
                        stepsNumber: 3,
                        onTapHandler: () {
                          Get.find<CreateParkingFormController>().increment();
                          Get.toNamed(ParkingPositionSelectorPage.routeName);
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

class FeatureTab extends StatelessWidget {
  final Feature feature;
  final bool selected;
  final Function onTapHanlder;

  FeatureTab({
    this.feature,
    this.selected,
    this.onTapHanlder,
  });

  @override
  Widget build(BuildContext context) {
    final backGroundColor =
        this.selected ? ParkaColors.parkaGreen : Color(0xFFE5E4E4);
    final itemsColor = this.selected ? Colors.white : ParkaColors.parkaGreen;

    return GestureDetector(
      onTap: () {
        this.onTapHanlder(this.selected);
      },
      child: Container(
        alignment: Alignment.center,
        child: LayoutBuilder(builder: (ctx, constr) {
          return Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: backGroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 7.0),
                  color: Colors.black38,
                  blurRadius: 5.0,
                ),
              ],
            ),
            height: 100,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  getFeatureIcon(
                    this.feature.name,
                  ),
                  color: itemsColor,
                ),
                Text(
                  this.feature.name,
                  style: TextStyle(
                    color: itemsColor,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
