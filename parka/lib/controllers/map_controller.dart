import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<GoogleMapController> mapController = Rx();
  List<Parking> currentParkings = List<Parking>().obs;
  List<Parking> filteredResults = List<Parking>().obs;

  void setCurrentParkings(List<Parking> newParkings) {
    newParkings.forEach((parking) {
      if (!currentParkings.contains(parking)) {
        currentParkings = newParkings.obs;
        filteredResults = newParkings.obs;
        return;
      }
    });
  }

  void setMapController(GoogleMapController controller) {
    mapController = controller.obs;
    return;
  }

  void searchParkings(String searchQuery) {
    filteredResults = [];

    searchQuery = searchQuery.toUpperCase();
    currentParkings.forEach((parking) {
      if (parking.parkingName.toUpperCase().contains(searchQuery) ||
          parking.sector.toUpperCase().contains(searchQuery) ||
          parking.information.toUpperCase().contains(searchQuery)) {
        filteredResults.add(parking);
      }
    });

    return;
  }
}
