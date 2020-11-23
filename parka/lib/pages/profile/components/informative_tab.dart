import 'package:ParkA/styles/text.dart';
import 'package:flutter/material.dart';

class InformativeTab extends StatelessWidget {
  final String data;
  final String informativeMessage;
  final Function onTapHandler;

  const InformativeTab({
    Key key,
    this.data,
    this.informativeMessage,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTapHandler ?? () {},
      child: Column(
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
      ),
    );
  }
}
