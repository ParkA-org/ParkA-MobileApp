import 'package:ParkA/components/Placeholders/parka_placeholder.dart';
import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";

class ParkaIdCardField extends StatelessWidget {
  const ParkaIdCardField({
    Key key,
    @required this.dataToDisplay,
    @required this.screenSize,
    this.label,
  }) : super(key: key);

  final String dataToDisplay;
  final Size screenSize;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            this.label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Color(0xFF0B768C),
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          this.dataToDisplay == null || this.dataToDisplay.isEmpty
              ? ParkAPlaceholder(
                  height: screenSize.height * 0.025,
                  width: screenSize.width * 0.6,
                )
              : AutoSizeText(
                  "${this.dataToDisplay}",
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                    // fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );
  }
}
