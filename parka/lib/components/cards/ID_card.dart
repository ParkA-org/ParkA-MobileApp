import 'package:ParkA/pages/create-user-information/components/parka_id_card_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class IDCard extends StatelessWidget {
  final String docNumber;

  final DateTime dateOfBirth;

  final String docType;

  final String nationality;

  final String placeOfBirth;

  const IDCard({
    Key key,
    this.docNumber,
    this.dateOfBirth,
    this.nationality,
    this.placeOfBirth,
    this.docType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String formattedDate =
        dateOfBirth == null ? null : DateFormat.yMMMd().format(dateOfBirth);
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(
            color: Color(0xFF0B768C),
            width: 4.0,
          )),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    // margin: EdgeInsets.fromLTRB(23, 15, 10, 14),
                    child: SvgPicture.asset(
                        'resources/images/BlueProfileIcon.svg'),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ParkaIdCardField(
                    dataToDisplay: docNumber,
                    screenSize: screenSize,
                    label: "No. de Documento",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // margin: EdgeInsets.fromLTRB(23, 0, 18, 13),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ParkaIdCardField(
                      screenSize: screenSize,
                      label: "Fecha de Nacimiento",
                      dataToDisplay: formattedDate,
                    ),
                    //
                  ),
                  Expanded(
                    child: ParkaIdCardField(
                      screenSize: screenSize,
                      label: "Nacionalidad",
                      dataToDisplay: nationality,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              // margin: EdgeInsets.fromLTRB(23, 0, 18, 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: ParkaIdCardField(
                      screenSize: screenSize,
                      label: "Lugar de Nacimiento",
                      dataToDisplay: placeOfBirth,
                    ),
                  ),
                  Expanded(
                    child: ParkaIdCardField(
                      dataToDisplay: docType,
                      label: "Tipo de documento",
                      screenSize: screenSize,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
