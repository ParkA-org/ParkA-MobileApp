import 'package:ParkA/components/Placeholders/parka_placeholder.dart';
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
                Container(
                  // margin: EdgeInsets.fromLTRB(23, 15, 10, 14),
                  child:
                      SvgPicture.asset('resources/images/BlueProfileIcon.svg'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "No. de Documento",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFF0B768C),
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    docNumber == null || docNumber.isEmpty
                        ? ParkAPlaceholder(
                            height: screenSize.height * 0.025,
                            width: screenSize.width * 0.6,
                          )
                        : Text(
                            "$docNumber",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // margin: EdgeInsets.fromLTRB(23, 0, 18, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Fecha de Nacimiento",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF0B768C),
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      dateOfBirth == null
                          ? ParkAPlaceholder(
                              height: screenSize.height * 0.025,
                              width: screenSize.width * 0.35,
                            )
                          : Text(
                              "$formattedDate",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Nacionalidad",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF0B768C),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      nationality == null || nationality.isEmpty
                          ? ParkAPlaceholder(
                              height: screenSize.height * 0.025,
                              width: screenSize.width * 0.35,
                            )
                          : Text(
                              "$nationality",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                    ],
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lugar de Nacimiento",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF0B768C),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      placeOfBirth == null || placeOfBirth.isEmpty
                          ? ParkAPlaceholder(
                              height: screenSize.height * 0.025,
                              width: screenSize.width * 0.35,
                            )
                          : Text(
                              "$placeOfBirth",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Tipo de documento",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF0B768C),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      docType == null || docType.isEmpty
                          ? ParkAPlaceholder(
                              height: screenSize.height * 0.025,
                              width: screenSize.width * 0.35,
                            )
                          : Text(
                              "$docType",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ],
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
