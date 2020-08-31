import 'package:ParkA/components/Buttons/feature_select_button.dart';
import "package:flutter/material.dart";

class FeatureSelectorFilter extends StatelessWidget {
  const FeatureSelectorFilter({
    Key key,
    this.renderAvaliableWidth,
    this.onTapHandler,
    this.featureTypes,
    this.selectedFeatures,
    this.iconNames,
  }) : super(key: key);

  final renderAvaliableWidth;
  final List<String> featureTypes;
  final List<String> iconNames;
  final Function onTapHandler;
  final List<bool> selectedFeatures;

  List<Widget> gridBuilder() {
    List<Widget> ret = new List();

    List<Widget> currentRow = new List();

    for (int i = 0; i < this.featureTypes.length; i++) {
      currentRow.add(
        FeatureSelectButton(
          renderAvaliableWidth: renderAvaliableWidth,
          label: this.featureTypes[i],
          index: i,
          isSelected: this.selectedFeatures[i],
          iconName: this.iconNames[i],
          onTapHandler: this.onTapHandler,
        ),
      );

      if (currentRow.length == 2 || i == this.featureTypes.length - 1) {
        ret.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: currentRow,
          ),
        );

        currentRow = new List();
      }
    }

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        "Caracteristicas",
        style: TextStyle(
            color: Color(0xFF0B768C),
            fontSize: 28.0,
            fontWeight: FontWeight.bold),
      ),
      children: this.gridBuilder(),
    );
  }
}
