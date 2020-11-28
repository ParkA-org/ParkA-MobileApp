import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:ParkA/styles/text.dart';
import 'package:ParkA/utils/functions/get_feature_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowParkingFeaturesWidget extends StatelessWidget {
  final List<Feature> features;

  const ShowParkingFeaturesWidget({
    Key key,
    @required this.features,
  }) : super(key: key);

  List<Widget> _viewBuilder() {
    List<Widget> ret = List();

    this.features.forEach((_feature) {
      ret.addAll([
        SvgPicture.asset(
          getFeatureIcon(
            _feature.name,
          ),
          color: ParkaColors.parkaGreen,
          height: 40.0,
          width: 40.0,
        ),
        SizedBox(
          width: 8.0,
        ),
      ]);
    });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return this.features.length == 0
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Caracteristicas",
                  style: kParkaTextStyleBoldGreen18,
                ),
              ),
              Container(
                height: 50.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: this._viewBuilder(),
                ),
              )
            ],
          );
  }
}
