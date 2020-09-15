import 'package:ParkA/components/Buttons/main_fab.dart';
import 'package:ParkA/components/Drawer/main_drawer.dart';
import 'package:ParkA/components/SearchBar/search_bar.dart';
import 'package:ParkA/pages/MapPage/Components/dummy_search.dart';
import 'package:ParkA/pages/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  static String routeName = "/mapPage";

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String _mapStyle;
  bool _fabIsVisible;
  LocationData userLocation;
  CameraPosition initialCameraPosition;

  @override
  void initState() {
    super.initState();
    _fabIsVisible = true;
    initialCameraPosition =
        CameraPosition(target: LatLng(18.487876, -69.9644807), zoom: 15.5);
    getCurrentLocation();

    rootBundle.loadString('resources/styles/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    GoogleMapController mapController;
    LocationData currentUserLocation = userLocation;
    return Scaffold(
      drawer: MainDrawer(),
      body: currentUserLocation == null
          ? Container() // Posible Loading screen
          : Stack(alignment: Alignment.bottomCenter, children: [
              GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                  mapController.setMapStyle(_mapStyle);
                },
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                initialCameraPosition: initialCameraPosition,
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

  void getCurrentLocation() async {
    final LocationData currentUserLocation = await Location().getLocation();
    setState(() {
      userLocation = currentUserLocation;
      initialCameraPosition = CameraPosition(
          target: LatLng(userLocation.latitude, userLocation.longitude),
          zoom: 15.5);
    });
  }
}
