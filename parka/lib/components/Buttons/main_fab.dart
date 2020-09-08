import 'package:flutter/material.dart';

class MainFAB extends StatelessWidget {
  const MainFAB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 5, offset: Offset(0, 10), color: Color(0x40000000))
        ], shape: BoxShape.circle),
        child: FloatingActionButton(
          onPressed: () => {Scaffold.of(context).openDrawer()},
          backgroundColor: Color(0xFF0B768C),
          child: Icon(
            Icons.menu,
            size: 42,
          ),
        ),
      ),
    );
  }
}
