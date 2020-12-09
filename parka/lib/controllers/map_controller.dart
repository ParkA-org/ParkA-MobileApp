import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<GoogleMapController> mapController = Rx();
  RxList<Parking> currentParkings = List<Parking>().obs;
  RxList<Parking> filteredResults = List<Parking>().obs;
  RxList<Widget> searchResults = List<Widget>().obs;

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
    if (searchQuery == null || (searchQuery?.isEmpty ?? true)) {
      filteredResults.update((value) {
        filteredResults = currentParkings;
      });
    } else {
      filteredResults.update((value) {
        filteredResults = RxList<Parking>();

        searchQuery = searchQuery.toUpperCase();
        currentParkings.forEach((parking) {
          if (parking.parkingName.toUpperCase().contains(searchQuery) ||
              (parking.sector?.toUpperCase()?.contains(searchQuery) ?? false) ||
              (parking.information?.toUpperCase()?.contains(searchQuery) ??
                  false)) {
            filteredResults.add(parking);
          }
        });
      });
    }
    update();
    return;
  }
}
