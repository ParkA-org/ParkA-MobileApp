import 'package:ParkA/components/Utils/styles/buttons.dart';
import 'package:flutter/material.dart';

class ReserveTypeSelectorWidget extends StatelessWidget {
  const ReserveTypeSelectorWidget({
    Key key,
    this.types,
    this.selectedTypes,
    this.onPressedHandler,
  }) : super(key: key);

  final List<String> types;
  final List<bool> selectedTypes;
  final Function onPressedHandler;

  List<Widget> _buttonsBuilder() {
    List<Widget> ret = new List<Widget>();

    for (int i = 0; i < this.types.length; ++i) {
      ret.add(
        Expanded(
          child: FilterButton(
            label: this.types[i],
            isSelected: this.selectedTypes[i],
            onTapHandler: this.onPressedHandler,
            index: i,
          ),
        ),
      );
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              "Tipo dereserva",
              style: TextStyle(
                  color: Color(0xFF0B768C),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: Row(children: this._buttonsBuilder()),
        ),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    @required this.label,
    @required this.isSelected,
    @required this.onTapHandler,
    @required this.index,
    Key key,
  }) : super(key: key);

  final String label;
  final bool isSelected;
  final Function onTapHandler;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTapHandler(this.label, this.index);
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(4.0),
        decoration: this.isSelected ? selectedStyle : notSelectedStyle,
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: this.isSelected ? Colors.white : Color(0xFF0B768C),
          ),
        ),
      ),
    );
  }
}
