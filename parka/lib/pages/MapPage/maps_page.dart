import 'package:ParkA/components/SearchBar/search_bar.dart';
import 'package:ParkA/pages/MapPage/Components/dummy_search.dart';
import 'package:ParkA/pages/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  static String routeName = "/mapPage";

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String _mapStyle;
  bool _fabIsVisible = true;

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('resources/styles/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    GoogleMapController mapController;
    return Scaffold(
      body: Stack(alignment: Alignment.bottomCenter, children: [
        GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            mapController.setMapStyle(_mapStyle);
          },
          initialCameraPosition: CameraPosition(
              target: LatLng(18.4849902, -69.9621916), zoom: 15.5),
          zoomControlsEnabled: false,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
          child: DummySearch(),
        ),
      ]),
      floatingActionButton: Visibility(
        visible: _fabIsVisible,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 5, offset: Offset(0, 10), color: Color(0x40000000))
          ], shape: BoxShape.circle),
          child: FloatingActionButton(
            onPressed: () => {},
            backgroundColor: Color(0xFF0B768C),
            child: Icon(
              Icons.menu,
              size: 42,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
