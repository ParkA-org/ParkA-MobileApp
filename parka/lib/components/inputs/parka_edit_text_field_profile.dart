import 'package:ParkA/styles/inputs.dart';
import 'package:flutter/material.dart';

class ParkaEditInputText extends StatelessWidget {
  final String label;
  final Color color;
  final String value;
  final int textFieldMaxLength;
  final Function onChangedHandler;

  const ParkaEditInputText({
    Key key,
    this.color,
    this.label,
    this.value,
    this.onChangedHandler,
    this.textFieldMaxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 18.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(3.0, 14.0),
              color: Colors.black38,
              blurRadius: 5.0,
            ),
          ]),
      child: TextField(
        maxLength: this.textFieldMaxLength ?? TextField.noMaxLength,
        decoration: kInputStyleSlim.copyWith(
          // labelText: this.label,
          hintStyle: TextStyle(
              color: Colors.black, fontSize: 20.0, fontFamily: "Montserrat"),
          fillColor: Colors.white,
          hintText: this.value,
        ),
        style: TextStyle(
            fontSize: 20.0, color: Colors.black, fontFamily: "Montserrat"),
        onChanged: this.onChangedHandler,
      ),
    );
  }
}
