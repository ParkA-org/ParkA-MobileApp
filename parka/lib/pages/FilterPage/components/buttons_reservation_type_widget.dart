import 'package:flutter/material.dart';

class ReserveTypeSelectorWidget extends StatelessWidget {
  const ReserveTypeSelectorWidget({
    Key key,
    this.types,
    this.onPressedHandler,
  }) : super(key: key);

  final List<String> types;
  final Function onPressedHandler;

  List<Widget> _buttonsBuilder() {
    List<Widget> ret = new List<Widget>();

    this.types.forEach((label) => {
          ret.add(
            Expanded(
              child: FilterButton(
                label: label,
                isSelected: true,
              ),
            ),
          )
        });

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
    Key key,
  }) : super(key: key);

  final String label;
  final bool isSelected;
  final Function onTapHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTapHandler();
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

final notSelectedStyle = BoxDecoration(
  border: Border.all(
    color: Color(0xFF0B768C),
    width: 2.0,
  ),
  borderRadius: BorderRadius.circular(20.0),
);

final selectedStyle = BoxDecoration(
  color: Color(0xFF0B768C),
  border: Border.all(
    color: Color(0xFF0B768C),
    width: 2.0,
  ),
  borderRadius: BorderRadius.circular(20.0),
);
