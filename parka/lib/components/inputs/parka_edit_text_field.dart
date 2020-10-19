import 'package:ParkA/styles/inputs.dart';
import 'package:flutter/material.dart';

class ParkaEditInput extends StatelessWidget {
  final String label;
  final String value;
  final int textFieldMaxLength;
  final Function onChangedHandler;

  const ParkaEditInput({
    Key key,
    this.label,
    this.value,
    this.onChangedHandler,
    this.textFieldMaxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(3.0, 10.0),
              color: Colors.black38,
              blurRadius: 5.0,
            ),
          ]),
      child: TextField(
        maxLength: this.textFieldMaxLength ?? TextField.noMaxLength,
        decoration: kInputStyleSlim.copyWith(
          // labelText: this.label,

          hintText: this.value,
        ),
        onChanged: this.onChangedHandler,
      ),
    );
  }
}
