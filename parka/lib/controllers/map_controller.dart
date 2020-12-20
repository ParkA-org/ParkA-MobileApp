import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/pages/filter/data/filter_input_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<GoogleMapController> mapController = Rx();

  RxList<Parking> currentParkings = List<Parking>().obs;
  RxList<Parking> filteredResults = List<Parking>().obs;
  RxList<Widget> searchResults = List<Widget>().obs;

  RxBool _loading;
  RxList<Parking> _parkings = RxList();
  Rx<ParkingFilterDto> _filterParkingDto = new ParkingFilterDto().obs;

  ParkingFilterDto get parkingFilterDto => this._filterParkingDto.value;
  bool get loading => this._loading.value;
  List<Parking> get parkings => this._parkings;

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
      filteredResults.obs.update((value) {
        filteredResults = currentParkings;
      });
    } else {
      filteredResults.obs.update((value) {
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

  // search
  void loadParkings() async {
    List<Parking> _searchResult =
        await ParkingUseCases.getAllParkingsSpots(this.parkingFilterDto);
    print(_searchResult.length);
    this._parkings.update((_instance) {
      this._parkings = _searchResult.obs;
    });
  }

  //filter logic
  void resetFilters() {
    this._filterParkingDto.update((_instance) {
      this._filterParkingDto = new ParkingFilterDto().obs;
    });
  }

  void setParkingNameSearch(String _searchString) {
    this._filterParkingDto.update((_instance) {
      _instance.parkingName = _searchString;
    });
  }

  void setRating(int _rating) {
    this._filterParkingDto.update((_instance) {
      _instance.rating = _rating.toDouble();
    });
  }

  void setPriceFilter(RangeValues _values) {
    this._filterParkingDto.update((_instance) {
      _instance.maxPrice = _values.end;
      _instance.minPrice = _values.start;
    });
  }

  void addFeature(String _feature) {
    this._filterParkingDto.update((_instance) {
      _instance.features.add(_feature);
    });
  }

  void removeFeature(String _feature) {
    this._filterParkingDto.update((_instance) {
      _instance.features.remove(_feature);
    });
  }
}
