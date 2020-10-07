import 'package:ParkA/components/Buttons/main_fab.dart';
import 'package:ParkA/components/Drawer/main_drawer.dart';
import 'package:ParkA/components/Modals/parking_detail.dart';
import 'package:ParkA/pages/MapPage/Components/dummy_search.dart';
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
  bool _loading;
  LocationData userLocation;
  CameraPosition initialCameraPosition;
  Set<Marker> test;
  BitmapDescriptor customIcon;

  void toggleFloatingActionButton() {
    setState(() {
      this._fabIsVisible = !_fabIsVisible;
    });
  }

  Future<void> getCurrentLocation() async {
    final LocationData currentUserLocation = await Location().getLocation();
    setState(
      () {
        userLocation = currentUserLocation;
        this._loading = false;
        print('THIS HAS LOADED  $_loading');
        initialCameraPosition = CameraPosition(
          target: LatLng(userLocation.latitude, userLocation.longitude),
          zoom: 15.5,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'resources/images/green-parking-icon.png')
        .then((onValue) {
      customIcon = onValue;
    });

    _fabIsVisible = true;
    _loading = true;
    test = {};
    initialCameraPosition =
        CameraPosition(target: LatLng(18.487876, -69.9644807), zoom: 15.5);
    getCurrentLocation();

    rootBundle.loadString('resources/styles/map_style.txt').then(
      (string) {
        _mapStyle = string;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GoogleMapController mapController;

    BuildContext mapPageContext = context;

    return Scaffold(
      drawer: MainDrawer(),
      floatingActionButton: Visibility(
        visible: _fabIsVisible,
        child: MainFAB(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                mapController.setMapStyle(_mapStyle);
                setState(() {
                  test.addAll({
                    Marker(
                        icon: customIcon,
                        markerId: MarkerId("Hello"),
                        position: LatLng(18.487876, -69.9644807),
                        onTap: () => showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                ParkingDetailModal(parkingId: "Hello"))),
                    Marker(
                        icon: customIcon,
                        markerId: MarkerId("Hello"),
                        position: LatLng(18.487876, -69.9644808),
                        onTap: () => showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                ParkingDetailModal(parkingId: "Hello"))),
                    Marker(
                        icon: customIcon,
                        markerId: MarkerId("Hello"),
                        position: LatLng(18.487876, -69.9644806),
                        onTap: () => showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                ParkingDetailModal(parkingId: "Hello"))),
                    Marker(
                        icon: customIcon,
                        markerId: MarkerId("Hello"),
                        position: LatLng(18.487875, -69.9644807),
                        onTap: () => showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                ParkingDetailModal(parkingId: "Hello")))
                  });
                });
              },
              markers: test,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: initialCameraPosition,
              zoomControlsEnabled: false,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Builder(
                builder: (context) => DummySearch(
                  // statusBarSize: MediaQuery.of(context).padding.top,
                  mainContext: mapPageContext,
                  buttonToggle: toggleFloatingActionButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
