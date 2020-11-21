import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/parking/parking_data_model.dart';
import 'package:ParkA/data/data-models/schedule/schedule_data_model.dart';
import 'package:ParkA/data/dtos/parking/create_parking_dto.dart';
import 'package:ParkA/utils/functions/upload_image.dart';
import 'package:ParkA/utils/graphql/mutations/parking_mutations.dart';
import 'package:ParkA/utils/graphql/queries/parking_queries.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql/client.dart';

class ParkingUseCases {
  static Future createParking(CreateParkingDto createParkingDto) async {
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
// TODO:FIX THIS
    // if (getNearbyParkingsResult.data != null &&
    //     getNearbyParkingsResult.data["getAllParkings"] != null) {
    //   final List<Parking> parkingData = Parking.parkingsFromJson(
    //       getNearbyParkingsResult.data["getAllParkings"]);
    //   return parkingData;
    // }

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
}
