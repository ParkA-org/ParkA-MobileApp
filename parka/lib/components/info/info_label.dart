import 'package:ParkA/styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class InfoLabelWidget extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  const InfoLabelWidget({
    Key key,
    @required this.label,
    @required this.value,
    this.labelStyle,
    this.valueStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                this.label,
                style: this.labelStyle ?? kParkaTextStyleBoldGreen18,
              ),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              this.value ?? "",
              maxLines: 1,
              style: this.valueStyle ?? kParkaTextStyleBoldBlack18,
            ),
          ),
        ],
      ),
    );
  }
}
