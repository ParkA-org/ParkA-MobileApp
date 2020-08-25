import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key key}) : super(key: key);

  static String routeName = "/mapPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(18.4849902, -69.9621916), zoom: 15.5),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 5, offset: Offset(0, 10), color: Color(0x40000000))
        ]),
        child: FloatingActionButton(
          onPressed: null,
          backgroundColor: Color(0xFF0B768C),
          child: Icon(
            Icons.menu,
            size: 42,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
