import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class InfoLabelWidget extends StatelessWidget {
  final String label;
  final String value;

  const InfoLabelWidget({
    Key key,
    @required this.label,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              this.label,
              style: kParkaTextStyleBoldGreen18,
            ),
          ),
          Text(
            this.value ?? "",
            style: kParkaTextStyleBoldBlack18,
          ),
        ],
      ),
    );
  }
}
