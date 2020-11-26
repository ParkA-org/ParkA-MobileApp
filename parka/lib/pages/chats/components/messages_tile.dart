import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MessagesTile extends StatelessWidget {
  final String messages;
  final bool type;

  const MessagesTile({
    Key key,
    this.messages,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: this.type == true
          ? Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: 8.0,
                  right: 10.0,
                ),
                child: AutoSizeText(
                  this.messages,
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xffC4C4C4),
              ),
            )
          : Container(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: 8.0,
                  right: 10.0,
                ),
                child: AutoSizeText(
                  this.messages,
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xff077187),
              ),
            ),
    );
  }
}
