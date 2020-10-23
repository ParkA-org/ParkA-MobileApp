import 'package:ParkA/components/headers/parka_header.dart';
import 'package:ParkA/components/inputs/parka_dropdown.dart';
import 'package:ParkA/data/data-models/body-style/body_style_data_model.dart';
import 'package:ParkA/data/data-models/make/make_data_model.dart';
import 'package:ParkA/data/data-models/model/model_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/dto/create_vehicle_dto.dart';
import 'package:ParkA/data/data-models/color/color_data_model.dart';
import 'package:ParkA/data/use-cases/body-style/body_style_use_cases.dart';

import 'package:ParkA/data/use-cases/color/color_use_cases.dart';
import 'package:ParkA/data/use-cases/make/make_use_cases.dart';
import 'package:ParkA/data/use-cases/model/model_use_cases.dart';
import 'package:ParkA/data/use-cases/vehicle/vehicle_use_cases.dart';
import 'package:ParkA/styles/inputs.dart';
import 'package:ParkA/styles/parkaIcons.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/form-validations/create_vehicle_form_validator.dart';
import 'package:ParkA/utils/functions/pick_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'components/parka-input/parka_input.dart';
import 'components/parka_image_card_widget.dart';

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
  String selectedMake;
  String selectedYear;

  bool dataLoading;
  List<Color> colors;
  List<String> colorsOptions;
  List<BodyStyle> bodyStyles;
  List<String> bodyStyleOptions;
  List<Model> models;
  List<String> modelsOptions;
  List<Make> makes;
  List<String> makesOptions;
  List<String> yearOptions;

  @override
  void initState() {
    super.initState();
    this.dataLoading = true;
    this.pictures = [];
    getFormData();
  }

  List<String> getYears() {
    List<String> ret = new List();

    for (int i = 1970; i <= DateTime.now().year; i++) {
      ret.add(i.toString());
    }

    return ret;
  }

  void getFormData() async {
    this.colors = await ColorUseCases.getAllColors();
    this.bodyStyles = await BodyStyleUseCases.getAllBodyStyles();
    this.models = await ModelUseCases.getAllModels();
    this.makes = await MakeUseCases.getAllMakes();

    this.bodyStyleOptions = new List.from(this.bodyStyles.map((e) => e.name));
    this.colorsOptions = new List.from(this.colors.map((e) => e.name));
    this.modelsOptions = new List.from(this.models.map((e) => e.name));
    this.makesOptions = new List.from(this.makes.map((e) => e.name));
    this.yearOptions = this.getYears();

    print(yearOptions);
    setState(() {
      this.dataLoading = false;
    });
  }

  void createVehicle() async {
    CreateVehicleDto createVehicleDto = new CreateVehicleDto(
      alias: this.alias,
      bodyStyle: this.bodyStyle,
      colorExterior: this.colorExterior,
      licensePlate: this.licensePlate,
      mainPicture: this.mainPicture,
      model: this.model,
      pictures: [],
      year: this.year,
    );

    bool checkForm = createVehicleFormValidator(createVehicleDto);

    if (!checkForm) {
      print("EROROR");
    }

    // bool createdResult = await VehicleUseCases.createVehicle(createVehicleDto);

    // if (createdResult) {
    //   Get.back();
    // }
  }

  List<Widget> carouselBuilder() {
    List<Widget> ret = new List();

    this.pictures.forEach((element) {
      ret.add(ParkaImageCardWidget(
        image: element,
      ));
      ret.add(
        SizedBox(
          width: 16.0,
        ),
      );
    });

    ret.add(ParkaImageCardWidget(
      onTapHandler: () async {
        String imagePath = await getImageFunction();
        if (imagePath != null) {
          setState(() {
            this.pictures.add(imagePath);
          });
        }
      },
    ));

    ret.add(
      SizedBox(
        width: 16.0,
      ),
    );

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ParkaColors.parkaGreen,
        child: Icon(Icons.add),
        onPressed: () async {
          this.createVehicle();
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              // title: Text("Agrega un Vehiculo"),
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Agrega un Vehiculo'),
              ),
              backgroundColor: ParkaColors.parkaGreen,
              expandedHeight: 200.0,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: ParkaImageCardWidget(
                          image: this.mainPicture,
                          onTapHandler: () async {
                            String imagePath = await getImageFunction();
                            if (imagePath != null) {
                              setState(() {
                                this.mainPicture = imagePath;
                              });
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: LayoutBuilder(
                          builder: (BuildContext context, constraints) {
                            // print(constraints.maxWidth - 32.0);

                            double cardWidth = constraints.maxWidth - 32.0 > 350
                                ? 350
                                : constraints.maxWidth - 32.0;
                            const creditCardProp = 1.58;

                            return ConstrainedBox(
                              constraints: constraints,
                              child: Container(
                                height: (cardWidth + 32.0) / creditCardProp,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: carouselBuilder(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Column(
                          children: [
                            ParkaEditInput(
                              type: ParkaInputType.textField,
                              label: "Placa del vehiculo",
                              maxLength: 7,
                              onChangedHandler: (String value) {
                                setState(() {
                                  this.licensePlate = value.substring(0, 8);
                                });
                              },
                            ),
                            ParkaEditInput(
                              type: ParkaInputType.textField,
                              label: "Alias del vehiculo",
                              maxLength: 25,
                            ),
                            ParkaEditInput(
                              type: ParkaInputType.dropDown,
                              label: "Ano del vehiculo",
                              dropDownOptions: yearOptions,
                              value: this.selectedYear,
                              onChangedHandler: (int index) {
                                setState(
                                  () {
                                    print("changed");
                                    this.year = this.yearOptions[index];
                                    this.selectedYear = this.yearOptions[index];
                                  },
                                );
                              },
                            ),
                            ParkaEditInput(
                              type: ParkaInputType.dropDown,
                              label: "Color del vehiculo",
                              dropDownOptions: colorsOptions,
                              value: this.selectedColor,
                              onChangedHandler: (int index) {
                                setState(
                                  () {
                                    print("changed");
                                    this.colorExterior = this.colors[index].id;
                                    this.selectedColor =
                                        this.colors[index].name;
                                    print(this.colors[index]);
                                  },
                                );
                              },
                            ),
                            ParkaEditInput(
                              type: ParkaInputType.dropDown,
                              label: "Marca del vehiculo",
                              dropDownOptions: makesOptions,
                              value: this.selectedMake,
                              onChangedHandler: (int index) {
                                setState(
                                  () {
                                    print("changed");

                                    this.selectedMake = this.makes[index].name;
                                    print(this.makes[index]);
                                  },
                                );
                              },
                            ),
                            ParkaEditInput(
                              type: ParkaInputType.dropDown,
                              label: "Modelo del vehiculo",
                              dropDownOptions: modelsOptions,
                              value: this.selectedModel,
                              onChangedHandler: (int index) {
                                setState(
                                  () {
                                    print("changed");
                                    this.model = this.models[index].id;
                                    this.selectedModel =
                                        this.models[index].name;
                                  },
                                );
                              },
                            ),
                            ParkaEditInput(
                              type: ParkaInputType.dropDown,
                              label: "Tipo de cuerpo",
                              dropDownOptions: bodyStyleOptions,
                              value: this.selectedBodyStyle,
                              onChangedHandler: (int index) {
                                setState(
                                  () {
                                    print("changed");
                                    this.bodyStyle = this.bodyStyles[index].id;
                                    this.selectedBodyStyle =
                                        this.bodyStyles[index].name;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
