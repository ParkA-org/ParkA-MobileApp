import 'package:ParkA/styles/inputs.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParkaDropDownField extends StatelessWidget {
  final String label;
  final String value;
  final Function onChangedHandler;
  final List<String> pickerOptions;

  const ParkaDropDownField({
    Key key,
    @required this.label,
    @required this.value,
    @required this.onChangedHandler,
    @required this.pickerOptions,
  }) : super(key: key);

  List<Widget> optionsBuilder() {
    List<Widget> ret = new List();

    this.pickerOptions.forEach((String element) {
      ret.add(
        Center(
          child: Text(element),
        ),
      );
    });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          builder: (BuildContext context) => Container(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                elevation: 0,
                title: Text(
                  this.label,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B768C),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Color(0xFF0B768C),
                      size: 32.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              body: CupertinoPicker(
                backgroundColor: Colors.white,
                scrollController: FixedExtentScrollController(
                  initialItem: 0,
                ),
                itemExtent: 60,
                onSelectedItemChanged: this.onChangedHandler ?? (int value) {},
                children: optionsBuilder(),
              ),
            ),
          ),
          context: context,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: Text(
                this.label,
                style: kParkaTextBaseStyleBold.copyWith(
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(
                      3.0,
                      10.0,
                    ),
                    color: Colors.black38,
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: TextField(
                enabled: false,
                decoration: kInputStyleSlim.copyWith(
                  // labelText: this.label,

                  hintText: this.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
