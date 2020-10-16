import 'package:ParkA/styles/inputs.dart';
import "package:flutter/material.dart";
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class FilterDatePicker extends StatelessWidget {
  const FilterDatePicker({
    Key key,
    this.date,
    this.datePickerHandler,
    this.minHourPickerHandler,
    this.maxHourPickerHandler,
  }) : super(key: key);

  final String date;
  final Function datePickerHandler;
  final Function minHourPickerHandler;
  final Function maxHourPickerHandler;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            "Disponibilidad",
            style: TextStyle(
              color: Color(0xFF0B768C),
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Fecha",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xFFD7D2D2),
                    ),
                    child: Center(
                      child: Text(
                        this.date,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      height: 300,
                      child: DatePickerWidget(
                        onConfirm: (dateTime, selectedIndex) =>
                            {datePickerHandler(dateTime)},
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.calendar_today,
                  color: Color(0xFF0B768C),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Horas",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50.0,
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLength: 5,
                    decoration: kInputStyleSlim,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      this.minHourPickerHandler(value);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.arrow_forward,
                  color: Color(0xFF0B768C),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50.0,
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: kInputStyleSlim,
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      value = value.length == 2 ? "$value:" : value;
                      this.maxHourPickerHandler(value);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
