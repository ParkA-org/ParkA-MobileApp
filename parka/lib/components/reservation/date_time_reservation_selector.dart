import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DateTimeScheduleSelectorPill extends StatelessWidget {
  final DateTime hourString;
  final Function setHourString;

  const DateTimeScheduleSelectorPill({
    Key key,
    @required this.hourString,
    this.setHourString,
  }) : super(key: key);

  String _formatDate() {
    final List<String> months = [
      "Enero",
      "Febrero",
      "Marzo",
      "Abril",
      "Mayo",
      "Junio",
      "Julio",
      "Agosto",
      "Septiembre",
      "Octubre",
      "Noviembre",
      "Diciembre",
    ];

    if (this.hourString == null) return "";
    int day = this.hourString.day;
    int year = this.hourString.year;
    int month = this.hourString.month;

    return "$day de ${months[month - 1]} $year";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          child: DatePickerWidget(
            onConfirm: setHourString ??
                (DateTime date, List<int> value) {
                  return;
                },
            dateFormat: 'dd/MM/yyyy',
            initialDateTime: this.hourString,
            onChange: setHourString ??
                (DateTime date, List<int> value) {
                  return;
                },
            minDateTime: DateTime(2020),
            pickerTheme: DateTimePickerTheme(
              itemTextStyle: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(
                  0xFF0B768C,
                ),
              ),
            ),
          ),
        ),
      ),
      child: Container(
        child: AutoSizeText(
          this._formatDate(),
          maxLines: 1,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: Color(0xFFC4C4C4),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }
}
