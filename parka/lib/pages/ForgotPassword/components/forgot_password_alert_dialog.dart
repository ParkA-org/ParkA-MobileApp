import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';

class ForgotPasswordAlertDialog extends StatelessWidget {
  const ForgotPasswordAlertDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xFF0B768C),
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SvgPicture.asset(
                'resources/images/checked.svg',
                allowDrawingOutsideViewBox: true,
                height: 50.0,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Correo Enviado",
                  style: TextStyle(
                    color: Color(0xFF0B768C),
                    fontSize: 24.0,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
