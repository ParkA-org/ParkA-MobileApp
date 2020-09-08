import 'package:ParkA/components/Buttons/main_fab.dart';
import 'package:ParkA/components/Drawer/main_drawer.dart';
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
  bool _fabIsVisible;

  @override
  void initState() {
    super.initState();
    _fabIsVisible = true;
    rootBundle.loadString('resources/styles/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    GoogleMapController mapController;
    return Scaffold(
      drawer: MainDrawer(),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        GoogleMap(
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
            mapController.setMapStyle(_mapStyle);
          },
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition(
              target: LatLng(18.4849902, -69.9621916), zoom: 15.5),
          zoomControlsEnabled: false,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
          child: Builder(
            builder: (context) => DummySearch(
              buttonToggle: toggleFloatingActionButton,
            ),
          ),
        ),
      ]),
      floatingActionButton: Visibility(
        visible: _fabIsVisible,
        child: MainFAB(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }

  void toggleFloatingActionButton() {
    setState(() {
      this._fabIsVisible = !_fabIsVisible;
    });
  }
}
