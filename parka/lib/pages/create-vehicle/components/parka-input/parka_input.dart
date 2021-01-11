import 'package:ParkA/styles/inputs.dart';
import 'package:ParkA/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParkaInputType {
  static String textField = 'text-field';
  static String dropDown = 'drop-down';
}

class ParkaEditInput extends StatelessWidget {
  final String label;
  final String value;
  final Function onChangedHandler;
  final int maxLength;
  final String type;
  final List dropDownOptions;

  const ParkaEditInput({
    Key key,
    this.label,
    this.value,
    this.maxLength,
    this.onChangedHandler,
    this.type,
    this.dropDownOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.type);
    if (this.type == ParkaInputType.textField) {
      return ParkaTextField(
        label: label,
        maxLength: maxLength,
        value: value,
        onChangedHandler: onChangedHandler,
      );
    } else if (this.type == ParkaInputType.dropDown) {
      return ParkaDropDownField(
        label: this.label,
        value: this.value,
        pickerOptions: this.dropDownOptions,
        onChangedHandler: this.onChangedHandler,
      );
    }

    return Container();
  }
}

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
        if (this.onChangedHandler != null &&
            this.pickerOptions.length > 0 &&
            this.value.isEmpty) {
          this.onChangedHandler(0);
        }
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

class ParkaTextField extends StatelessWidget {
  const ParkaTextField({
    Key key,
    this.value,
    this.inputType,
    this.maxLength,
    this.enabled,
    @required this.label,
    this.onChangedHandler,
  }) : super(key: key);

  final String label;
  final bool enabled;
  final int maxLength;
  final String value;
  final Function onChangedHandler;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              maxLength: this.maxLength ?? TextField.noMaxLength,
              keyboardType: this.inputType ?? TextInputType.text,
              enabled: this.enabled ?? true,
              decoration: kInputStyleSlim.copyWith(
                // labelText: this.label,
                hintText: this.value,
              ),
              onChanged: this.onChangedHandler,
            ),
          ),
        ],
      ),
    );
  }
}
