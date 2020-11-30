import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<GoogleMapController> mapController;
  List<Parking> currentParking = List<Parking>().obs;

  void setCurrentParkings(List<Parking> newParkings) {
    newParkings.forEach((parking) {
      if (!currentParking.contains(parking)) {
        currentParking = newParkings.obs;
        return;
      }
    });
  }

  void setMapController(GoogleMapController controller) {
    mapController = controller.obs;
  }
}
