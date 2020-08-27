import 'package:ParkA/pages/FilterPage/components/filter_date_widget.dart';
import 'package:ParkA/pages/FilterPage/components/buttons_reservation_type_widget.dart';
import 'package:ParkA/pages/FilterPage/components/featureFilterWidget/feature_filter_widget.dart';
import "package:flutter/material.dart";

import 'components/slider_price_widget.dart';
import 'components/star_rating_widget.dart';

class FilterPage extends StatefulWidget {
  static String routeName = "/parkSearchFilterPage";

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double rentPriceFilter = 200.0;
  int parkingVoteFilter = 4;
  List<String> parkingTypeReservation = new List();
  List<String> parkingFeatureList = new List();
  List<bool> isSelectedParkingType = [false, false, false];
  List<String> iconNames = [
    "camFeature.svg",
    "accessControlFeature.svg",
    "guardFeature.svg",
    "carWashFeature.svg",
    "carChargeFeature.svg",
    "valetParkingFeature.svg",
  ];
  List<bool> isSelectedParkingFeature = [
    false,
    false,
    false,
    false,
    false,
    false
  ];
  String selectedDate = "";
  String minHour = '';
  String maxHour = '';

  void changeParkingVoteFilter(int vote) {
    setState(() {
      this.parkingVoteFilter = vote;
    });
  }

  void changeParkingPriceFilter(double price) {
    setState(
      () {
        this.rentPriceFilter = price;
      },
    );
  }

  void changeParkingTypeFilter(String type, int index) {
    setState(() {
      this.isSelectedParkingType[index] = !this.isSelectedParkingType[index];
      if (!this.isSelectedParkingType[index]) {
        this.parkingTypeReservation.remove(type);
        return;
      }

      this.parkingTypeReservation.add(type);
    });

    print(this.parkingTypeReservation);
  }

  void changeParkingFeatureFilter(String type, int index) {
    setState(() {
      this.isSelectedParkingFeature[index] =
          !this.isSelectedParkingFeature[index];
      if (!this.isSelectedParkingFeature[index]) {
        this.parkingFeatureList.remove(type);
        return;
      }

      this.parkingFeatureList.add(type);
    });

    print(this.parkingFeatureList);
  }

  void parseDate(DateTime date) {
    String year = date.toString().split(" ")[0].split("-")[0];
    String month = date.toString().split(" ")[0].split("-")[1];
    String day = date.toString().split(" ")[0].split("-")[2];
    setState(() {
      this.selectedDate = "$day $month $year";
    });
  }

  void changeParkingMinHourFilter(String hour) {
    String filterhour = hour.length == 2 ? hour + ":" : hour;
    setState(() {
      this.minHour = filterhour;
    });
    print(this.minHour);
  }

  void changeParkingMaxHourFilter(String hour) {
    setState(() {
      this.maxHour = hour.length == 2 ? "$hour:" : hour;
    });
  }

  void resetFilters() {
    print("entered");
    setState(() {
      this.selectedDate = "";
      this.parkingTypeReservation.clear();
      this.parkingFeatureList.clear();
      this.minHour = "";
      this.maxHour = "";
      for (int i = 0; i < this.isSelectedParkingType.length; i++) {
        this.isSelectedParkingType[i] = false;
      }

      for (int i = 0; i < this.isSelectedParkingFeature.length; i++) {
        this.isSelectedParkingFeature[i] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          flex: 0,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Filtros",
                                  style: TextStyle(
                                    color: Color(0xFF0B768C),
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    "Reiniciar",
                                    style: TextStyle(
                                      color: Color(0xFFED9393),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: this.resetFilters,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: StarRatingFilter(
                            rating: this.parkingVoteFilter,
                            rateHandler: this.changeParkingVoteFilter,
                          ),
                        ),
                        Expanded(
                          child: PriceSliderWidget(
                            rentPriceFilter: rentPriceFilter,
                            sliderChangeHandler: changeParkingPriceFilter,
                          ),
                        ),
                        Expanded(
                          child: ReserveTypeSelectorWidget(
                            types: [
                              "Horas",
                              "Dias",
                              "Semanas",
                            ],
                            selectedTypes: this.isSelectedParkingType,
                            onPressedHandler: this.changeParkingTypeFilter,
                          ),
                        ),
                        Expanded(
                          child: FilterDatePicker(
                            date: this.selectedDate,
                            datePickerHandler: this.parseDate,
                            minHourPickerHandler:
                                this.changeParkingMinHourFilter,
                            maxHourPickerHandler:
                                this.changeParkingMaxHourFilter,
                          ),
                        ),
                        FeatureSelectorFilter(
                          renderAvaliableWidth: viewportConstraints.maxWidth,
                          onTapHandler: this.changeParkingFeatureFilter,
                          selectedFeatures: this.isSelectedParkingFeature,
                          featureTypes: [
                            "Camara de seguridad",
                            "Control de acceso",
                            "Vigilancia",
                            "Car Wash",
                            "Puerto de Carga",
                            "Valet Parking"
                          ],
                          iconNames: this.iconNames,
                        ),
                        Expanded(
                          flex: 0,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "Terminos y condiciones legales",
                              style: TextStyle(
                                color: Color(0xFF0B768C),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
