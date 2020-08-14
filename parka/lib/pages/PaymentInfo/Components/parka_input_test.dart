import "package:flutter/material.dart";

class ParkaInputTest extends StatelessWidget {
  final Function handler;
  final int inputMaxLength;
  final TextInputType inputType;

  const ParkaInputTest({
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
        maxLength: this.inputMaxLength ?? TextField.noMaxLength,
        decoration: kInputStyle,
        keyboardType: this.inputType,
        onChanged: this.handler,
      ),
    );
  }
}

const kInputStyle = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(color: Colors.grey),
  filled: true,
  counterText: "",
  fillColor: Color(0xFFD7D2D2),
  contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);
