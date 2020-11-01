import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/vehicle/dto/create_vehicle_dto.dart';
import 'package:ParkA/data/data-models/vehicle/vehicle_data_model.dart';

import 'package:ParkA/utils/functions/upload_image.dart';
import 'package:ParkA/utils/graphql/mutations/vehicle_mutations.dart';
import 'package:ParkA/utils/graphql/queries/vehicle_queries.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class VehicleUseCases {
  static Future<List<Vehicle>> getAllUserVehicles() async {
    final graphqlClient = Get.find<GraphqlClientController>();

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllUserVehiclesQuery));

    final QueryResult getAllUserVehiclesResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    print(getAllUserVehiclesResult.data);
    if (getAllUserVehiclesResult.data != null) {
      final List<Vehicle> vehiclesData = Vehicle.vehiclesFromJason(
        getAllUserVehiclesResult.data["getAllUserVehicles"],
      );

      return vehiclesData;
    }

    return [];
  }

  static Future<bool> createVehicle(CreateVehicleDto createVehicleDto) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    String imageUrl = await uploadImage(createVehicleDto.mainPicture);

    print(createVehicleDto.model);
    print(createVehicleDto.licensePlate);
    print(createVehicleDto.colorExterior);
    print(createVehicleDto.mainPicture);
    print(imageUrl);
    print(createVehicleDto.year);
    print(createVehicleDto.alias);
    print(createVehicleDto.bodyStyle);

    final createVehicleInput = {
      "data": {
        "model": createVehicleDto.model,
        "licensePlate": createVehicleDto.licensePlate,
        "colorExterior": createVehicleDto.colorExterior,
        "mainPicture": imageUrl,
        "pictures": [],
        "year": createVehicleDto.year,
        "alias": createVehicleDto.alias,
        "bodyStyle": createVehicleDto.bodyStyle,
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(createVehicleMutation),
      variables: createVehicleInput,
    );

    final QueryResult createVehiclesResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    print(createVehiclesResult.data);
    print(createVehiclesResult.exception.toString());
    if (createVehiclesResult.data != null) {
      return true;
    }

    return false;
  }
}