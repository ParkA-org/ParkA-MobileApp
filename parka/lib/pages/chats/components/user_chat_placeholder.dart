import 'package:ParkA/styles/parka_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatListPlaceHolder extends StatelessWidget {
  const ChatListPlaceHolder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: 100.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: SvgPicture.asset(
              "resources/images/Messages.svg",
              height: 400.0,
            ),
          ),
        ],
      ),
    );
  }
}
