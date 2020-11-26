import 'package:flutter/material.dart';

class MessagesTile extends StatelessWidget {
  final String messages;
  final String user;
  final bool type;
  final Function onTapHandler;

  const MessagesTile({
    Key key,
    this.messages,
    this.user,
    this.type,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: this.type == true
          ? Container(
              child: Text("Prueba"),
            )
          : Container( alignment: Alignment.bottomLeft ,child: Text(this.messages, style: TextStyle(fontFamily: "Montserrat", ),),
    );
  }
}
