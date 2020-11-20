import 'package:ParkA/components/alerts/parka_base_alert_widget.dart';
import 'package:ParkA/components/floating-action-button/parka_floating_action_button.dart';
import 'package:ParkA/data/data-models/body-style/body_style_data_model.dart';
import 'package:ParkA/data/data-models/make/make_data_model.dart';
import 'package:ParkA/data/data-models/model/model_data_model.dart';
import 'package:ParkA/data/data-models/vehicle/dto/create_vehicle_dto.dart';
import 'package:ParkA/data/data-models/color/color_data_model.dart'
    as VehicleColor;
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';
import 'package:ParkA/data/dtos/vehicle/update_vehicle_dto.dart';
import 'package:ParkA/data/enums/parking_place_holder_type.dart';
import 'package:ParkA/data/use-cases/body-style/body_style_use_cases.dart';
import 'package:ParkA/data/use-cases/color/color_use_cases.dart';
import 'package:ParkA/data/use-cases/make/make_use_cases.dart';
import 'package:ParkA/data/use-cases/model/model_use_cases.dart';
import 'package:ParkA/data/use-cases/vehicle/vehicle_use_cases.dart';
import 'package:ParkA/pages/create-vehicle/components/parka-input/parka_input.dart';
import 'package:ParkA/pages/create-vehicle/components/parka_resizable_on_scroll_app_bar.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/form-validations/create_vehicle_form_validator.dart';
import 'package:ParkA/utils/form-validations/update_vehicle_from_validation.dart';
import 'package:ParkA/utils/functions/get_year_list.dart';
import 'package:ParkA/utils/functions/pick_image.dart';
import 'package:ParkA/utils/functions/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:ParkA/components/images/parka_add_images_carousel.dart';
import 'package:ParkA/components/images/parka_image_card_widget.dart';

class EditVehiclePage extends StatefulWidget {
  static String routeName = "edit-vehicle";

  final Vehicle vehicle;

  EditVehiclePage({
    @required this.vehicle,
  });

  @override
  _EditVehiclePageState createState() => _EditVehiclePageState();
}

class _EditVehiclePageState extends State<EditVehiclePage> {
  Vehicle _vehicle;

  UpdateVehicleDto _updateVehicleDto;

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
    this._vehicle = this.widget.vehicle;
    this._updateVehicleDto = new UpdateVehicleDto(
      //TODO: update vehicle model
      id: this._vehicle.id,
      alias: this._vehicle.alias,
      bodyStyle: this._vehicle.bodyStyle.id,
      colorExterior: this._vehicle.color.id,
      licensePlate: this._vehicle.licensePlate,
      mainPicture: this._vehicle.mainPicture,
      model: this._vehicle.model.id,
      pictures: this._vehicle.pictures,
      year: this._vehicle.year.toString(),
    );
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

  void updateVehicle() async {
    bool checkForm = updateVehicleFormValidator(_updateVehicleDto);

    if (!checkForm) {
      Get.snackbar(
        "Error",
        "Se verifico un error",
        backgroundColor: ParkaColors.parkaGoogleRed,
      );
      return;
    }

    bool createdResult = await VehicleUseCases.updateVehicle(_updateVehicleDto);

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

  Future removeVehicle(int index) {
    return buildShowDialog(context, RemoveCarImageAlert(
      removeImage: () {
        print(index);
        setState(() {
          this._updateVehicleDto.pictures.removeAt(index);
        });
        Get.back();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ParkaFloatingActionButton(
        iconData: Icons.done,
        onPressedHandler: () async {
          this.updateVehicle();
        },
      ),
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: this.dataLoading,
          opacity: 0.5,
          child: CustomScrollView(
            slivers: [
              ParkaResizableOnScrollAppBar(
                title: "Edita tu vehiculo",
              ),
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
                            type: PlaceHolderType.Car,
                            image: this._updateVehicleDto.mainPicture,
                            onTapHandler: () async {
                              String imagePath = await getImageFunction();
                              if (imagePath != null) {
                                setState(() {
                                  this._updateVehicleDto.mainPicture =
                                      imagePath;
                                });
                              }
                            },
                          ),
                          this._updateVehicleDto.mainPicture != null
                              ? ParkaAddImagesCarousel(
                                  carouselType: CarouselType.Form,
                                  placeholderType: PlaceHolderType.Car,
                                  pictures: this._updateVehicleDto.pictures,
                                  onTapHandler: () async {
                                    String imagePath = await getImageFunction();
                                    if (imagePath != null) {
                                      setState(() {
                                        this
                                            ._updateVehicleDto
                                            .pictures
                                            .add(imagePath);
                                      });
                                    }
                                  },
                                  onLongPressHandler: this.removeVehicle,
                                )
                              : Container(),
                          Column(
                            children: [
                              ParkaEditInput(
                                type: ParkaInputType.textField,
                                label: "Placa del vehiculo",
                                value: this._vehicle.licensePlate,
                                maxLength: 7,
                                onChangedHandler: (String value) {
                                  setState(() {
                                    this._updateVehicleDto.licensePlate =
                                        value.substring(0, 7);
                                  });
                                },
                              ),
                              ParkaEditInput(
                                type: ParkaInputType.textField,
                                label: "Alias del vehiculo",
                                value: this._vehicle.alias,
                                maxLength: 25,
                                onChangedHandler: (String value) {
                                  setState(() {
                                    this._updateVehicleDto.alias =
                                        value.substring(0, 7);
                                  });
                                },
                              ),
                              ParkaEditInput(
                                type: ParkaInputType.dropDown,
                                label: "Año del vehiculo",
                                dropDownOptions: yearOptions,
                                value: this.selectedYear ??
                                    this._vehicle.year.toString(),
                                onChangedHandler: (int index) {
                                  FocusManager.instance.primaryFocus.unfocus();
                                  setState(
                                    () {
                                      this._updateVehicleDto.year =
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
                                value: this.selectedColor ??
                                    this._vehicle.color.name,
                                onChangedHandler: (int index) {
                                  FocusManager.instance.primaryFocus.unfocus();
                                  setState(
                                    () {
                                      this._updateVehicleDto.colorExterior =
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
                                value: this.selectedMake ??
                                    this._vehicle.model.make.name,
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
                                      this._updateVehicleDto.model =
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
                                value: this.selectedModel ??
                                    this._vehicle.model.name,
                                onChangedHandler: (int index) {
                                  FocusManager.instance.primaryFocus.unfocus();
                                  setState(
                                    () {
                                      this._updateVehicleDto.model =
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
                                value: this.selectedBodyStyle ??
                                    this._vehicle.bodyStyle.name,
                                onChangedHandler: (int index) {
                                  FocusManager.instance.primaryFocus.unfocus();
                                  setState(
                                    () {
                                      this._updateVehicleDto.bodyStyle =
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

class RemoveCarImageAlert extends StatelessWidget {
  final Function removeImage;

  RemoveCarImageAlert({this.removeImage});

  @override
  Widget build(BuildContext context) {
    return BaseAlertWidget(
      child: Text(
        "Quieres eliminar esta foto?",
        style: kParkaBigButtonTextStyle.copyWith(
          fontSize: 20.0,
          color: ParkaColors.parkaGreen,
        ),
      ),
      actions: [
        FlatButton(
            onPressed: this.removeImage,
            child: Text(
              "Eliminar",
              style: kParkaTextBaseStyleBold,
            )),
        FlatButton(
            onPressed: () => Get.back(),
            child: Text(
              "Ignorar",
              style: kParkaTextBaseStyleBold,
            )),
      ],
    );
  }
}
