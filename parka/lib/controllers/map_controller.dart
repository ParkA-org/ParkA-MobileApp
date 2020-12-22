import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/use-cases/parking/parking_use_cases.dart';
import 'package:ParkA/pages/filter/data/filter_input_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<GoogleMapController> mapController = Rx();

  RxBool _loading;
  RxList<Parking> _parkings = RxList();
  RxList<Parking> _textSearchParkings = RxList();
  Rx<ParkingFilterDto> _filterParkingDto = new ParkingFilterDto().obs;

  ParkingFilterDto get parkingFilterDto => this._filterParkingDto.value;
  bool get loading => this._loading.value;
  List<Parking> get parkings => this._parkings;
  List<Parking> get textSearchParkings => this._textSearchParkings;

  void setMapController(GoogleMapController controller) {
    mapController = controller.obs;
    return;
  }

  // search
  void loadParkings(bool _textSearch) async {
    List<Parking> _searchResult = await ParkingUseCases.getAllParkingsSpots(
      this.parkingFilterDto,
      _textSearch,
    );
    print(_searchResult.length);

    if (_textSearch) {
      this._textSearchParkings.assignAll(_searchResult);
    } else {
      this._parkings.assignAll(_searchResult);
    }
  }

  //filter logic
  void resetFilters() {
    this._filterParkingDto.update((_instance) {
      final _position = _instance.position;
      this._filterParkingDto = new ParkingFilterDto(
        position: _position,
      ).obs;
    });
  }

  void setPosition(LatLng _position) {
    this._filterParkingDto.update((_instance) {
      _instance.position = _position;
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
