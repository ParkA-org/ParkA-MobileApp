import 'package:flutter/material.dart';
import "package:ParkA/components/Utils/styles/text.dart";

class InformativeTab extends StatelessWidget {
  final String data;
  final String informativeMessage;

  const InformativeTab({Key key, this.data, this.informativeMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              this.data,
              style: kParkaBigButtonTextStyle,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              this.informativeMessage,
              textAlign: TextAlign.center,
              style: kParkaInputDefaultSyle.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
