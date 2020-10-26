import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/data/data-models/body-style/body_style_data_model.dart';
import 'package:ParkA/data/data-models/make/make_data_model.dart';
import 'package:ParkA/data/data-models/model/model_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/dto/create_vehicle_dto.dart';
import 'package:ParkA/data/data-models/color/color_data_model.dart'
    as VehicleColor;
import 'package:ParkA/data/use-cases/body-style/body_style_use_cases.dart';
import 'package:ParkA/data/use-cases/color/color_use_cases.dart';
import 'package:ParkA/data/use-cases/make/make_use_cases.dart';
import 'package:ParkA/data/use-cases/model/model_use_cases.dart';
import 'package:ParkA/data/use-cases/vehicle/vehicle_use_cases.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/utils/form-validations/create_vehicle_form_validator.dart';
import 'package:ParkA/utils/functions/get_year_list.dart';
import 'package:ParkA/utils/functions/pick_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'components/parka-input/parka_input.dart';
import 'components/parka_add_images_carousel.dart';
import 'components/parka_image_card_widget.dart';
import 'components/parka_resizable_on_scroll_app_bar.dart';

class CreateVehiclePage extends StatefulWidget {
  static String routeName = "create-vehicle";

  @override
  _CreateVehiclePageState createState() => _CreateVehiclePageState();
}

class _CreateVehiclePageState extends State<CreateVehiclePage> {
  CreateVehicleDto createVehicleDto = new CreateVehicleDto(
    pictures: [],
  );

  String selectedModel;
  String selectedColor;
  String selectedBodyStyle;
  String selectedMake;
  String selectedYear;

  bool dataLoading;
  List<VehicleColor.Color> colors;
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
    getFormData();
  }

  void getFormData() async {
    this.colors = await ColorUseCases.getAllColors();
    this.bodyStyles = await BodyStyleUseCases.getAllBodyStyles();
    this.models = await ModelUseCases.getAllModels();
    this.makes = await MakeUseCases.getAllMakes();

    this.bodyStyleOptions = new List.from(this.bodyStyles.map((e) => e.name));
    this.colorsOptions = new List.from(this.colors.map((e) => e.name));
    this.modelsOptions = new List.from(this.makes[0].models.map((e) => e.name));
    this.makesOptions = new List.from(this.makes.map((e) => e.name));
    this.yearOptions = getYearsList(DateTime.now().year);

    setState(() {
      this.dataLoading = false;
    });
  }

  void createVehicle() async {
    bool checkForm = createVehicleFormValidator(createVehicleDto);

    if (!checkForm) {
      Get.snackbar(
        "Error",
        "Llena todos los campos",
        backgroundColor: ParkaColors.parkaGoogleRed,
      );
      return;
    }

    bool createdResult = await VehicleUseCases.createVehicle(createVehicleDto);

    if (createdResult) {
      Get.back();
    } else {
      Get.snackbar(
        "Error",
        "Ocurrio un error",
        backgroundColor: ParkaColors.parkaGoogleRed,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.add,
        onPressedHandler: () async {
          this.createVehicle();
        },
      ),
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: this.dataLoading,
          opacity: 0.5,
          child: CustomScrollView(
            slivers: [
              ParkaResizableOnScrollAppBar(),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        32.0,
                        0,
                        32.0,
                        32.0,
                      ),
                      child: Column(
                        children: [
                          ParkaImageCardWidget(
                            image: this.createVehicleDto.mainPicture,
                            onTapHandler: () async {
                              String imagePath = await getImageFunction();
                              if (imagePath != null) {
                                setState(() {
                                  this.createVehicleDto.mainPicture = imagePath;
                                });
                              }
                            },
                          ),
                          ParkaAddImagesCarousel(
                            pictures: this.createVehicleDto.pictures,
                            onTapHandler: () async {
                              String imagePath = await getImageFunction();
                              if (imagePath != null) {
                                setState(() {
                                  this.createVehicleDto.pictures.add(imagePath);
                                });
                              }
                            },
                          ),
                          Column(
                            children: [
                              ParkaEditInput(
                                type: ParkaInputType.textField,
                                label: "Placa del vehiculo",
                                maxLength: 7,
                                onChangedHandler: (String value) {
                                  setState(() {
                                    this.createVehicleDto.licensePlate =
                                        value.substring(0, 7);
                                  });
                                },
                              ),
                              ParkaEditInput(
                                type: ParkaInputType.textField,
                                label: "Alias del vehiculo",
                                maxLength: 25,
                                onChangedHandler: (String value) {
                                  setState(() {
                                    this.createVehicleDto.alias =
                                        value.substring(0, 7);
                                  });
                                },
                              ),
                              ParkaEditInput(
                                type: ParkaInputType.dropDown,
                                label: "Ano del vehiculo",
                                dropDownOptions: yearOptions,
                                value: this.selectedYear,
                                onChangedHandler: (int index) {
                                  FocusManager.instance.primaryFocus.unfocus();
                                  setState(
                                    () {
                                      this.createVehicleDto.year =
                                          this.yearOptions[index];
                                      this.selectedYear =
                                          this.yearOptions[index];
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
                                  FocusManager.instance.primaryFocus.unfocus();
                                  setState(
                                    () {
                                      this.createVehicleDto.colorExterior =
                                          this.colors[index].id;
                                      this.selectedColor =
                                          this.colors[index].name;
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
                                  FocusManager.instance.primaryFocus.unfocus();
                                  setState(
                                    () {
                                      this.selectedMake =
                                          this.makes[index].name;
                                      this.modelsOptions = List.from(this
                                          .makes[index]
                                          .models
                                          .map((e) => e.name));
                                      this.selectedModel =
                                          this.modelsOptions[0];
                                      this.createVehicleDto.model =
                                          this.makes[index].models[0].id;
                                      this.models = this.makes[index].models;
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
                                  FocusManager.instance.primaryFocus.unfocus();
                                  setState(
                                    () {
                                      this.createVehicleDto.model =
                                          this.models[index].id;
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
                                  FocusManager.instance.primaryFocus.unfocus();
                                  setState(
                                    () {
                                      this.createVehicleDto.bodyStyle =
                                          this.bodyStyles[index].id;
                                      this.selectedBodyStyle =
                                          this.bodyStyles[index].name;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
