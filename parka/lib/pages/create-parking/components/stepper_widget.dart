import 'package:ParkA/controllers/create-parking-form/create_parking_form_controller.dart';
import 'package:ParkA/styles/parka_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParkaStepperWidget extends StatelessWidget {
  final int stepsNumber;
  final int index;
  final Function onTapHandler;

  ParkaStepperWidget({
    Key key,
    @required this.stepsNumber,
    @required this.index = 1,
    this.onTapHandler,
  }) : super(key: key);

  List<Widget> stepperBuilder() {
    List<Widget> ret = new List();

    for (int i = 0; i < this.stepsNumber; i++) {
      ret.add(
        Expanded(
          child: Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: this.index > i ? ParkaColors.parkaGreen : Colors.white,
              border: Border.all(
                color: ParkaColors.parkaGreen,
                width: 1.5,
              ),
            ),
          ),
        ),
      );

      ret.add(Expanded(
        child: Divider(
          thickness: 1.0,
          // width: 50.0,
          color: Color(0xFF949494),
        ),
      ));
    }

    ret.add(
      Expanded(
        child: GestureDetector(
          onTap: this.onTapHandler,
          child: Container(
            width: 30.0,
            height: 30.0,
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: ParkaColors.parkaGreen,
                size: 20.0,
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: ParkaColors.parkaGreen,
              border: Border.all(
                color: ParkaColors.parkaGreen,
                width: 1.5,
              ),
            ),
          ),
        ),
      ),
    );

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: this.stepperBuilder(),
      ),
    );
  }
}
