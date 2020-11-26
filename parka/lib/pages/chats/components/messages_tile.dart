import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MessagesTile extends StatelessWidget {
  final String messages;
  final bool type;

  const MessagesTile({
    Key key,
    @required this.messages,
    @required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: this.type == true
          ? Padding(
              padding: const EdgeInsets.only(right: 70.0),
              child: Container(
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
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(17),
                      topRight: Radius.circular(17)),
                  color: Color(0xffC4C4C4),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Container(
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
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(17),
                      topLeft: Radius.circular(17)),
                  color: Color(0xff077187),
                ),
              ),
            ),
    );
  }
}
