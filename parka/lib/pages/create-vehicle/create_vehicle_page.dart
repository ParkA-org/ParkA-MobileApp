import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/components/inputs/parka_dropdown.dart';
import 'package:ParkA/data/data-models/body-style/body_style_data_model.dart';
import 'package:ParkA/data/data-models/model/model_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/dto/create_vehicle_dto.dart';
import 'package:ParkA/data/data-models/color/color_data_model.dart';
import 'package:ParkA/data/use-cases/body-style/body_style_use_cases.dart';

import 'package:ParkA/data/use-cases/color/color_use_cases.dart';
import 'package:ParkA/data/use-cases/model/model_use_cases.dart';
import 'package:ParkA/data/use-cases/vehicle/vehicle_use_cases.dart';
import 'package:ParkA/styles/inputs.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/functions/pick_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class CreateVehiclePage extends StatefulWidget {
  static String routeName = "create-vehicle";

  @override
  _CreateVehiclePageState createState() => _CreateVehiclePageState();
}

class _CreateVehiclePageState extends State<CreateVehiclePage> {
  String model;
  String licensePlate;
  String colorExterior;
  String mainPicture;
  List<String> pictures;
  String year;
  String alias;
  String bodyStyle;

  String selectedModel;
  String selectedColor;
  String selectedBodyStyle;

  bool dataLoading;
  List<Color> colors;
  List<String> colorsOptions;
  List<BodyStyle> bodyStyles;
  List<String> bodyStyleOptions;
  List<Model> models;
  List<String> modelsOptions;

  @override
  void initState() {
    super.initState();
    this.dataLoading = true;
    getFormData();
  }

  void getFormData() async {
    this.colors = await ColorUseCases.getAllColors();
    this.bodyStyles = await BodyStyleUseCases.getAllBodyStyles();
    this.models = await ModelUseCases.getAllModels();

    this.bodyStyleOptions = new List.from(this.bodyStyles.map((e) => e.name));
    this.colorsOptions = new List.from(this.colors.map((e) => e.name));
    this.modelsOptions = new List.from(this.models.map((e) => e.name));
    setState(() {
      this.dataLoading = false;
    });
  }

  void createVehicle() async {
    bool createdResult = await VehicleUseCases.createVehicle(
      new CreateVehicleDto(
        alias: this.alias,
        bodyStyle: this.bodyStyle,
        colorExterior: this.colorExterior,
        licensePlate: this.licensePlate,
        mainPicture: this.mainPicture,
        model: this.model,
        pictures: [],
        year: this.year,
      ),
    );

    if (createdResult) {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size currentScreen = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ParkaColors.parkaGreen,
        child: Icon(Icons.add),
        onPressed: () {
          this.createVehicle();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: ParkaColors.parkaGreen,
                ),
                child: ParkaHeader(color: Colors.white),
              ),
            ),
            Expanded(
              child: ModalProgressHUD(
                inAsyncCall: this.dataLoading,
                child: this.dataLoading
                    ? Container()
                    : ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: ParkaColors.parkaGreen,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(3.0, 7.0),
                                  color: Colors.black38,
                                  blurRadius: 5.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Agrega tu Vehiculo",
                                  style: kParkaTextStyleBoldWhite20,
                                ),
                                ParkaEditInput(
                                  value: "Placa del vehiculo",
                                  onChangedHandler: (value) {
                                    setState(() {
                                      this.licensePlate = value;
                                    });
                                  },
                                ),
                                ParkaEditInput(
                                  value: "Ano",
                                  onChangedHandler: (value) {
                                    setState(() {
                                      this.year = value;
                                    });
                                  },
                                ),
                                ParkaEditInput(
                                  value: "Alias",
                                  onChangedHandler: (value) {
                                    setState(() {
                                      this.alias = value;
                                    });
                                  },
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    print("tapped");
                                    String imagePath = await getImageFunction();
                                    print(imagePath);
                                    setState(() {
                                      this.mainPicture = imagePath;
                                    });
                                  },
                                  child: ParkaEditInput(
                                    value:
                                        this.mainPicture ?? "Imagen principal",
                                    isImagePicker: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ParkADropdown(
                                    text: "Tipo de Cuerpo",
                                    textSize: 16.0,
                                    selectedItem: this.selectedBodyStyle,
                                    options: this.bodyStyleOptions,
                                    height: currentScreen.height * 0.03,
                                    width: currentScreen.width * 0.8,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          this.selectedBodyStyle =
                                              this.bodyStyles[value].name;
                                          this.bodyStyle =
                                              this.bodyStyles[value].id;
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ParkADropdown(
                                    text: "Color",
                                    textSize: 16.0,
                                    selectedItem: this.selectedColor,
                                    options: this.colorsOptions,
                                    height: currentScreen.height * 0.03,
                                    width: currentScreen.width * 0.8,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          this.selectedColor =
                                              this.colors[value].name;
                                          this.colorExterior =
                                              this.colors[value].id;
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ParkADropdown(
                                    text: "Modelo",
                                    textSize: 16.0,
                                    selectedItem: this.selectedModel,
                                    options: this.modelsOptions,
                                    height: currentScreen.height * 0.03,
                                    width: currentScreen.width * 0.8,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          this.selectedModel =
                                              this.models[value].name;
                                          this.model = this.models[value].id;
                                        },
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ParkaEditInput extends StatelessWidget {
  final String label;
  final String value;
  final Function onChangedHandler;
  final bool isImagePicker;

  const ParkaEditInput({
    Key key,
    this.label,
    this.value,
    this.onChangedHandler,
    this.isImagePicker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(3.0, 10.0),
              color: Colors.black38,
              blurRadius: 5.0,
            ),
          ]),
      child: TextField(
        enabled: this.isImagePicker != null ? !this.isImagePicker : true,
        decoration: kInputStyleSlim.copyWith(
          // labelText: this.label,
          hintText: this.value,
        ),
        onChanged: this.onChangedHandler,
      ),
    );
  }
}
