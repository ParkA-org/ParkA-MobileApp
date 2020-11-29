import 'package:ParkA/styles/inputs.dart';
import "package:flutter/material.dart";

class ParkaInputTest extends StatelessWidget {
  final Function handler;
  final bool enable;
  final int inputMaxLength;
  final TextInputType inputType;

  const ParkaInputTest({
    this.enable,
    this.handler,
    this.inputMaxLength,
    this.inputType,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
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
