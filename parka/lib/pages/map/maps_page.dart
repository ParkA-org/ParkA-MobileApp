import 'package:ParkA/components/modals/parking_detail_modal.dart';
import 'package:ParkA/components/buttons/main_fab.dart';
import 'package:ParkA/components/drawer/private-drawer/private_drawer_n.dart';
import 'package:ParkA/components/drawer/public-drawer/public_drawer.dart';
import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/controllers/map_controller.dart';
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
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
  BitmapDescriptor _customGreenPinIcon;
  BitmapDescriptor _customRedPinIcon;

  final UserController user = Get.find<UserController>();
  final graphqlClient = Get.find<GraphqlClientController>();
  final mapController = Get.put(MapController());

  @override
  void initState() {
    super.initState();

    this._fabIsVisible = true;
    this._loading = true;
    nearbyParkings = {};
    initialCameraPosition =
        CameraPosition(target: LatLng(18.487876, -69.9644807), zoom: 15.5);

    this._getMapPageData();
  }

  Future<BitmapDescriptor> _getCustomPin() async {
    return BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'resources/images/green-parking-icon.png');
  }

  Future<BitmapDescriptor> _getCustomPinRed() async {
    return BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'resources/images/red-parking-icon.png');
  }

  Future<void> _getUserReservationsCount() async {
    this._reservationsAsClientCount =
        await ReservationUseCases.getAllReservationsAsClientCount();
    this._reservationsAsOwnerCount =
        await ReservationUseCases.getAllReservationsAsOwnerCount();
    print(this._reservationsAsClientCount);
    print(this._reservationsAsOwnerCount);
  }

  Future<LocationData> _getCurrentLocation() async {
    final LocationData currentUserLocation = await Location().getLocation();

    return currentUserLocation;
  }

  void toggleFloatingActionButton() {
    setState(() {
      this._fabIsVisible = !_fabIsVisible;
    });
  }

  Future<String> getMapStyle() async {
    return await rootBundle.loadString('resources/styles/map_style.txt');
  }

  void _getMapPageData() async {
    this._mapStyle = await this.getMapStyle();
    this._customGreenPinIcon = await this._getCustomPin();
    this._customRedPinIcon = await this._getCustomPinRed();
    await this._getUserReservationsCount();
    print("USER LOCATION IS  ${this.userLocation}");
    this.userLocation = await this._getCurrentLocation();
    print("USER LOCATION NOW IS  ${this.userLocation}");
    mapController.mapController.value.animateCamera(CameraUpdate.newLatLng(
        LatLng(userLocation.latitude, userLocation.longitude)));

    if (this.userLocation != null) {
      this
          .mapController
          .setPosition(LatLng(userLocation.latitude, userLocation.longitude));

      this.mapController.loadParkings();
    }

    setState(() {
      this._loading = false;
    });
  }

  Set<Marker> _markerBuilder(List<Parking> _parkings) {
    Set<Marker> ret = new Set();

    _parkings.forEach((parking) {
      ret.add(Marker(
        markerId: MarkerId("${parking.id}"),
        position: LatLng(parking.latitude, parking.longitude),
        icon: parking.isAvailable == true
            ? _customGreenPinIcon
            : _customRedPinIcon,
        onTap: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              mapController.mapController.value.animateCamera(
                  CameraUpdate.newLatLng(
                      LatLng(parking.latitude - 0.003, parking.longitude)));
              return ParkingDetailModal(parking: parking);
            }),
      ));
    });

    return ret;
  }

  @override
  Widget build(BuildContext context) {
    print("MAP BUILDED");

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
        child: ModalProgressHUD(
          inAsyncCall: this._loading,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Obx(
                () => GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    mapController.setMapController(controller);
                    mapController.mapController.value.setMapStyle(_mapStyle);
                  },
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  initialCameraPosition: initialCameraPosition,
                  zoomControlsEnabled: false,
                  // markers: nearbyParkings,
                  markers: this._markerBuilder(this.mapController.parkings),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Builder(
                  builder: (context) => DummySearch(
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
