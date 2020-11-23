import 'package:ParkA/styles/parka_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoImagePlaceholder extends StatelessWidget {
  const NoImagePlaceholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "resources/images/no-pictures-icon.svg",
                width: 160.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Este parqueo no tiene imagenes',
                  style: TextStyle(
                      color: ParkaColors.parkaGreen,
                      fontFamily: "Montserrat",
                      fontSize: 28.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
