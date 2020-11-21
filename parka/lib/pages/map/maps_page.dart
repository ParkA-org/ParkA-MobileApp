import 'package:ParkA/components/modals/parking_detail.dart';
import 'package:ParkA/components/buttons/main_fab.dart';
import 'package:ParkA/components/drawer/private-drawer/private_drawer_n.dart';

import 'package:ParkA/components/drawer/public-drawer/public_drawer.dart';

import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/controllers/user_controller.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/data/use-cases/reservation/reservation_use_cases.dart';

import 'package:ParkA/pages/map/components/dummy_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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
  int _reservationsAsClientCount;
  int _reservationsAsOwnerCount;
  LocationData userLocation;
  CameraPosition initialCameraPosition;
  Set<Marker> nearbyParkings;
  BitmapDescriptor customIcon;

  final UserController user = Get.find<UserController>();
  final graphqlClient = Get.find<GraphqlClientController>();

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
    nearbyParkings = {};
    getCurrentLocation();
    initialCameraPosition =
        CameraPosition(target: LatLng(18.487876, -69.9644807), zoom: 15.5);

    rootBundle.loadString('resources/styles/map_style.txt').then(
      (string) {
        _mapStyle = string;
      },
    );

    this.getUserReservationsCount();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'resources/images/green-parking-icon.png')
        .then((onValue) {
      customIcon = onValue;
    });
  }

  void getUserReservationsCount() async {
    this._reservationsAsClientCount =
        await ReservationUseCases.getAllReservationsAsClientCount();
    this._reservationsAsOwnerCount =
        await ReservationUseCases.getAllReservationsAsOwnerCount();
    setState(() {});
  }

  void getNearParkings(LatLng userLocation) async {
    Set<Marker> parkingPins = {};
    List<Parking> nearParkings =
        await ParkingUseCases.getNearParkings(userLocation);

    if (nearParkings != null && nearParkings.length > 0) {
      nearParkings.forEach((parking) {
        parkingPins.add(Marker(
            markerId: MarkerId("${parking.id}"),
            position: LatLng(parking.latitude, parking.longitude),
            icon: customIcon,
            onTap: () => showModalBottomSheet(
                context: context,
                builder: (context) => ParkingDetailModal(parking: parking))));
      });
    }
    if (!nearbyParkings.containsAll(parkingPins) &&
        nearbyParkings.length != parkingPins.length) {
      setState(() {
        nearbyParkings = parkingPins;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("MAP BUILDED");
    if (userLocation != null) {
      this.getNearParkings(
          LatLng(userLocation.latitude, userLocation.longitude));
    }
    GoogleMapController mapController;

    BuildContext mapPageContext = context;

    return Scaffold(
      drawer: user.user?.value == null
          ? PublicDrawer()
          : PrivateDrawer(
              reservationsAsCLientCount: this._reservationsAsClientCount,
              reservationsAsOwnerCount: this._reservationsAsOwnerCount,
            ),
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
              },
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition: initialCameraPosition,
              zoomControlsEnabled: false,
              markers: nearbyParkings,
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
