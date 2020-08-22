import 'package:ParkA/pages/FilterPage/components/buttons_reservation_type_widget.dart';
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

  void changeParkingTypeFilter(String type, bool isSelected) {
    setState(() {
      if (isSelected) {
        this.parkingTypeReservation.remove(type);
        return;
      }

      this.parkingTypeReservation.add(type);
    });

    print(this.parkingTypeReservation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
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
              Expanded(
                child: ExpansionTile(
                  title: Text("Caracteristicas"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
