import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/dtos/parking/create_parking_dto.dart';
import 'package:ParkA/utils/functions/upload_image.dart';
import 'package:ParkA/utils/graphql/mutations/parking_mutations.dart';
import 'package:get/get.dart';
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

    final createParkingInput = {
      "data": {
        "countParking": createParkingDto.countParking,
        "latitude": createParkingDto.lastitude,
        "longitude": createParkingDto.longitude,
        "parkingName": createParkingDto.parkingName,
        "calendar": {
          "monday": [
            {"start": 1500, "finish": 1600}
          ],
          "tuesday": [],
          "wednesday": [],
          "thursday": [],
          "friday": [],
          "saturday": [],
          "sunday": []
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
}
