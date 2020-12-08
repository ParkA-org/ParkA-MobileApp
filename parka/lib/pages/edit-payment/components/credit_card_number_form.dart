import 'package:ParkA/components/inputs/parka_input_test.dart';
import "package:flutter/material.dart";

class CreditCardNumberForm extends StatelessWidget {
  final List formHandlers;

  const CreditCardNumberForm({Key key, @required this.formHandlers})
      : super(key: key);

  List<Widget> formBuilder() {
    List<Widget> ret = new List<Widget>();

    this.formHandlers.forEach((handler) {
      ret.add(Expanded(
        child: ParkaInputTest(
          handler: handler,
          inputMaxLength: 4,
          inputType: TextInputType.number,
        ),
      ));
    });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: this.formBuilder());
  }
}
