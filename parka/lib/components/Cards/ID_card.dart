import 'package:ParkA/components/Placeholders/parka_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IDCard extends StatelessWidget {
  const IDCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Card(
        elevation: 20,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFF0B768C), width: 5),
            borderRadius: BorderRadius.circular(25.0)),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.fromLTRB(23, 15, 10, 14),
                    child: SvgPicture.asset(
                        'resources/images/BlueProfileIcon.svg')),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "No. de Documento",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFF0B768C),
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    ParkAPlaceholder(
                      height: screenSize.height * 0.025,
                      width: screenSize.width * 0.6,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(23, 0, 18, 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fecha de Nacimiento",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0xFF0B768C),
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      ParkAPlaceholder(
                        height: screenSize.height * 0.025,
                        width: screenSize.width * 0.35,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      ParkAPlaceholder(
                        height: screenSize.height * 0.025,
                        width: screenSize.width * 0.35,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(23, 0, 18, 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      ParkAPlaceholder(
                        height: screenSize.height * 0.025,
                        width: screenSize.width * 0.35,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      ParkAPlaceholder(
                        height: screenSize.height * 0.025,
                        width: screenSize.width * 0.35,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}