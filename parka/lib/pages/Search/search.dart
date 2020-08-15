import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Color(0xFF0B768C),
            ),
          ),
          Expanded(child: Container()),
          Expanded(child: ListView()),
        ],
      ),
    );
  }
}
