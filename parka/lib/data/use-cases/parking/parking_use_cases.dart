import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/dtos/parking/create_parking_dto.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class ParkingUseCases {
  static Future createParking(CreateParkingDto createParkingDto) async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    const String createParkingMutation = r"""
    mutation ($data:CreateParkingInput!){
      createParking(
        createParkingInput: $data
      ) {
        id
      }
    }
    """;

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
        "pictures": createParkingDto.pictures,
        "mainPicture":
            "https://parka-api-bucket-aws.s3.amazonaws.com/parqueo2_89e234acd5.png",
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
