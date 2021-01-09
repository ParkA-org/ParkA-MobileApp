import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/schedule/per_day_schedule_data_model.dart';
import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';
import 'package:ParkA/data/dtos/parking/create_parking_dto.dart';
import 'package:ParkA/data/dtos/parking/update_parking_dto.dart';
import 'package:ParkA/pages/filter/data/filter_input_dto.dart';
import 'package:ParkA/utils/functions/upload_image.dart';
import 'package:ParkA/utils/graphql/mutations/parking_mutations.dart';
import 'package:ParkA/utils/graphql/queries/parking_queries.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql/client.dart';

class ParkingUseCases {
  static Future<String> createParking(CreateParkingDto createParkingDto) async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    String imageUrl = await uploadImage(createParkingDto.mainPicture);
    List<String> imagesUrls =
        await uploadMultipleImages(createParkingDto.pictures);

    print(createParkingDto.pictures);
    print(imagesUrls);

    final createParkingInput = {
      "data": {
        "countParking": createParkingDto.countParking,
        "latitude": createParkingDto.lastitude,
        "longitude": createParkingDto.longitude,
        "parkingName": createParkingDto.parkingName,
        "calendar": {
          "monday": Schedule.toJsonArray(createParkingDto.calendar['monday']),
          "tuesday": Schedule.toJsonArray(createParkingDto.calendar['tuesday']),
          "wednesday":
              Schedule.toJsonArray(createParkingDto.calendar['wednesday']),
          "thursday":
              Schedule.toJsonArray(createParkingDto.calendar['thursday']),
          "friday": Schedule.toJsonArray(createParkingDto.calendar['friday']),
          "saturday":
              Schedule.toJsonArray(createParkingDto.calendar['saturday']),
          "sunday": Schedule.toJsonArray(createParkingDto.calendar['sunday'])
        },
        "priceHours": createParkingDto.priceHours,
        "pictures": imagesUrls,
        "mainPicture": imageUrl,
        "sector": createParkingDto.sector,
        "direction": createParkingDto.direccion,
        "information": createParkingDto.information,
        "features": createParkingDto.features
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(createParkingMutation),
      variables: createParkingInput,
    );

    final createParkingResult = await graphqlClient.mutate(mutationOptions);

    print(createParkingResult.data);
    print(createParkingResult.exception);
    if (createParkingResult.data != null) {
      print("created");
      return createParkingResult.data["createParking"]["id"];
    }

    return null;
  }

  static Future deleteParking(String _parkingID) async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    final deleteParkingInput = {
      "data": {
        "id": _parkingID,
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(deleteParkingMutation),
      variables: deleteParkingInput,
    );

    final deleteParkingResult = await graphqlClient.mutate(mutationOptions);

    if (deleteParkingResult.data != null) {
      return true;
    }

    print(deleteParkingResult.exception ?? "");
    return false;
  }

  static Future updateParking(UpdateParkingDto _updateParkingDto) async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    String imageUrl = _updateParkingDto.mainPicture;

    bool _isPath = !(GetUtils.isURL(imageUrl));

    List<String> _parkingPictures = new List();

    if (_isPath) {
      imageUrl = await uploadImage(_updateParkingDto.mainPicture);
    }

    for (String _picture in _updateParkingDto.pictures) {
      _isPath = !(GetUtils.isURL(_picture));
      String picture = _picture;
      if (_isPath) {
        picture = await uploadImage(picture);
      }
      _parkingPictures.add(picture);
    }

    print(_updateParkingDto.pictures);
    print(_parkingPictures);

    final updateParkingInput = {
      "data": {
        "id": _updateParkingDto.parkingId,
        "calendar": {
          "monday": Schedule.toJsonArray(_updateParkingDto.calendar['monday']),
          "tuesday":
              Schedule.toJsonArray(_updateParkingDto.calendar['tuesday']),
          "wednesday":
              Schedule.toJsonArray(_updateParkingDto.calendar['wednesday']),
          "thursday":
              Schedule.toJsonArray(_updateParkingDto.calendar['thursday']),
          "friday": Schedule.toJsonArray(_updateParkingDto.calendar['friday']),
          "saturday":
              Schedule.toJsonArray(_updateParkingDto.calendar['saturday']),
          "sunday": Schedule.toJsonArray(_updateParkingDto.calendar['sunday'])
        },
        "features": _updateParkingDto.features,
        "pictures": _parkingPictures,
        "mainPicture": imageUrl,
      }
    };

    if (_updateParkingDto.information != null &&
        _updateParkingDto.information.isNotEmpty) {
      updateParkingInput["data"]["information"] = _updateParkingDto.information;
    }

    if (_updateParkingDto.parkingName != null &&
        _updateParkingDto.parkingName.isNotEmpty) {
      updateParkingInput["data"]["parkingName"] = _updateParkingDto.parkingName;
    }

    if (_updateParkingDto.countParking != null &&
        _updateParkingDto.countParking != 0) {
      updateParkingInput["data"]["countParking"] =
          _updateParkingDto.countParking;
    }

    if (_updateParkingDto.priceHours != null &&
        _updateParkingDto.priceHours != 0) {
      updateParkingInput["data"]["priceHours"] =
          _updateParkingDto.priceHours.toString();
    }

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(updateParkingMutation),
      variables: updateParkingInput,
    );

    final _updateParkingResult = await graphqlClient.mutate(mutationOptions);

    print(_updateParkingResult.data);
    print(_updateParkingResult.exception);
    if (_updateParkingResult.data != null) {
      print("UPDATED");
      return true;
    }

    return false;
  }

  static Future getNearParkings(LatLng userLocation) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    final userLocationInput = {
      "userLocation": {
        "where": {
          "position_near": {
            "latitude": userLocation.latitude,
            "longitude": userLocation.longitude
          }
        }
      }
    };

    QueryOptions queryOptions = QueryOptions(
        documentNode: gql(getNearbyParkingsQuery),
        variables: userLocationInput);

    QueryResult getNearbyParkingsResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    print(getNearbyParkingsResult.data);

    if (getNearbyParkingsResult.data != null &&
        getNearbyParkingsResult.data["getAllParkings"] != null) {
      final parkingData = getNearbyParkingsResult.data["getAllParkings"];
      final List<Parking> parkings = Parking.parkingsFromJson(parkingData);
      return parkings;
    }

    return new List<Parking>();
  }

  static Future<List<Parking>> getAllUserParkings() async {
    final graphqlClient = Get.find<GraphqlClientController>();

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllUserParkingQuery));

    final QueryResult getAllUserParkingsResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    print(getAllUserParkingsResult.data);
    if (getAllUserParkingsResult.data != null &&
        getAllUserParkingsResult.data["getAllUserParkings"] != null) {
      final List<Parking> parkingsData = Parking.parkingsFromJson(
          getAllUserParkingsResult.data["getAllUserParkings"]);

      return parkingsData;
    }
    return [];
  }

  static Future<Parking> getParkingById(String id) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    Map<String, String> getParkingByIdInput = {
      "data": id,
    };

    QueryOptions queryOptions = QueryOptions(
      documentNode: gql(getParkingByIdQuery),
      variables: getParkingByIdInput,
    );

    final QueryResult getParkingByIdResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    print(getParkingByIdResult.data);
    if (getParkingByIdResult.data != null) {
      final Parking parkingsData =
          Parking.parkingFromJson(getParkingByIdResult.data["getParkingById"]);

      return parkingsData;
    }
    return null;
  }

  static Future<List<Parking>> getAllParking() async {
    final graphqlClient = Get.find<GraphqlClientController>();

    QueryOptions queryOptions = QueryOptions(documentNode: gql(getAllParkings));

    final QueryResult getAllUserParkingsResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    if (getAllUserParkingsResult.data != null &&
        getAllUserParkingsResult.data["getAllParkings"] != null) {
      final List<Parking> parkingsData = Parking.parkingsFromJson(
          getAllUserParkingsResult.data["getAllParkings"]);

      return parkingsData;
    }
    return [];
  }

  static Future<List<Parking>> getAllParkingsSpots(
    ParkingFilterDto _parkingFilterDto,
    bool _textSearch,
  ) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    Map<String, dynamic> _input = {
      "data": {"where": {}}
    };

    if (_textSearch &&
        _parkingFilterDto.parkingName != null &&
        _parkingFilterDto.parkingName.length != 0) {
      _input["data"]["where"]["parkingName_contains"] =
          _parkingFilterDto.parkingName;
    }

    if (!_textSearch && _parkingFilterDto.position != null) {
      _input["data"]["where"]["position_near"] = {
        "latitude": _parkingFilterDto.position.latitude,
        "longitude": _parkingFilterDto.position.longitude
      };
    }

    if (_parkingFilterDto.rating != null) {
      _input["data"]["where"]["rating_gte"] = _parkingFilterDto.rating;
    }

    if (_parkingFilterDto.maxPrice != null) {
      _input["data"]["where"]["priceHours_lte"] = _parkingFilterDto.maxPrice;
    }

    if (_parkingFilterDto.minPrice != null) {
      _input["data"]["where"]["priceHours_gte"] = _parkingFilterDto.minPrice;
    }

    if (_parkingFilterDto.features.length != 0) {
      _input["data"]["where"]["features_in"] = _parkingFilterDto.features;
    }

    print(_input);

    QueryOptions queryOptions = QueryOptions(
      documentNode: gql(getFilteredParkingsQuery),
      variables: _input,
    );

    final QueryResult getAllUserParkingsResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    if (getAllUserParkingsResult.data != null &&
        getAllUserParkingsResult.data["getAllParkings"] != null) {
      final List<Parking> parkingsData = Parking.parkingsFromJson(
          getAllUserParkingsResult.data["getAllParkings"]);

      return parkingsData;
    }
    return [];
  }

  static Future<List<PerDaySchedule>> getParkingAvaliability(
      String id, String date) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    Map<String, dynamic> getParkingByIdInput = {
      "data": {
        "parking": id,
        "date": date,
      }
    };

    QueryOptions queryOptions = QueryOptions(
      documentNode: gql(getParkingAvaliabilityQuery),
      variables: getParkingByIdInput,
    );

    final QueryResult _result = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    print(_result.data);
    if (_result.data != null) {
      return PerDaySchedule.schedulesFromJson(
          _result.data["getParkingAvaliability"]);
    }
    return null;
  }
}
