import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  static String routeName = "/chats-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Chat"),
        ),
      ),
    );
  }
}
