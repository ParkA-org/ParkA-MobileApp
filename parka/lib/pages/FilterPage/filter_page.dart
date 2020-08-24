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
                      children: <Widget>[
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
                          child: Column(
                            children: [
                              Expanded(child: Text("Disponibilidad")),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text("Fecha"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text("Horas"),
                                  ],
                                ),
                              ),
                            ],
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
                        )
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
