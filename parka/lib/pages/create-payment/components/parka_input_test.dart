import 'package:ParkA/styles/inputs.dart';
import "package:flutter/material.dart";

class ParkaInputTest extends StatelessWidget {
  final Function handler;
  final bool enable;
  final int inputMaxLength;
  final TextInputType inputType;
  final bool enable_padding;

  const ParkaInputTest({
    this.enable,
    this.handler,
    this.inputMaxLength,
    this.inputType,
    this.enable_padding,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          this.enable_padding != true ? EdgeInsets.all(8.0) : EdgeInsets.all(0),
      height: 50.0,
      child: TextField(
        enabled: this.enable ?? true,
        maxLength: this.inputMaxLength ?? TextField.noMaxLength,
        decoration: kInputStyleSlim,
        keyboardType: this.inputType,
        onChanged: this.handler,
      ),
    );
  }
}
