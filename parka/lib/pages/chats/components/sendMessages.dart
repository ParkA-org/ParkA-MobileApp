import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendMessages extends StatelessWidget {
  const SendMessages({
    Key key,
    @required this.screenSize,
    @required this.hintText,
  }) : super(key: key);

  final Size screenSize;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: screenSize.height * 0.09,
      width: screenSize.width * 1,
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, bottom: 20.0),
        child: Row(
          children: [
            Container(
              width: screenSize.width * 0.76,
              child: TextField(
                onSubmitted: (value) => {},
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintMaxLines: 1,
                  hintText: this.hintText,
                ),
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 9.0),
              child: InkWell(
                child: SvgPicture.asset(
                  "resources/images/SendButtom.svg",
                  width: screenSize.width * 0.1,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
