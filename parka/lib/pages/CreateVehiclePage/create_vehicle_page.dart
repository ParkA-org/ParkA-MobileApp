import 'package:ParkA/data_models/bodyStyle/body_style_data_model.dart';
import 'package:ParkA/data_models/model/model_data_model.dart';
import 'package:ParkA/use-cases/bodyStyle/body_style_use_cases.dart';
import 'package:ParkA/use-cases/color/color_use_cases.dart';
import 'package:ParkA/use-cases/model/model_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:ParkA/data_models/color/color_data_model.dart';
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

  bool dataLoading;
  List<Color> colors;
  List<BodyStyle> bodyStyles;
  List<Model> models;

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

    setState(() {
      this.dataLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: this.dataLoading,
        child: this.dataLoading ? Container() : ListView(),
      ),
    ));
  }
}
