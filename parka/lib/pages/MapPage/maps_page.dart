import 'dart:ui';

import 'package:ParkA/components/Buttons/main_fab.dart';
import 'package:ParkA/components/Drawer/main_drawer.dart';
import 'package:ParkA/pages/MapPage/Components/dummy_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../components/Utils/styles/parka_colors.dart';

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
    _fabIsVisible = true;
    _loading = true;
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
    LocationData currentUserLocation = userLocation;

    BuildContext mapPageContext = context;

    return Scaffold(
      drawer: MainDrawer(),
      floatingActionButton: Visibility(
        visible: _fabIsVisible,
        child: MainFAB(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: SafeArea(
        child: ModalProgressHUD(
          color: ParkaColors.parkaGreen,
          inAsyncCall: this._loading,
          opacity: 0.2,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
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
      ),
    );
  }
}
