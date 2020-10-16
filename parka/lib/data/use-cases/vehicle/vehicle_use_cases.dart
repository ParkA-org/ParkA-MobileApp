import 'package:ParkA/components/Utils/functions/upload_image.dart';
import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data_models/vehicle/dto/create_vehicle_dto.dart';
import 'package:ParkA/data/data_models/vehicle/vehicle_data_model.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class VehicleUseCases {
  static Future<List<Vehicle>> getAllUserVehicles() async {
    final graphqlClient = Get.find<GraphqlClientController>();
    String getAllUserVehicles = r"""
    query{
      getAllUserVehicles{
        id
        licensePlate
        model{
          name
        }
        verified
        detail
        colorExterior{
          name
        }
        mainPicture
        pictures
        year
        alias
        bodyStyle{
          name
        } 
      }
    }
    """;

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllUserVehicles));

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
    final String createVehicleMutation = r"""
    mutation($data:createVehicleInput!){
      createVehicle(createVehicleInput:$data){
        id
        model{
          name
        }
        licensePlate
        verified
        detail
        colorExterior{
          name
        }
        mainPicture
        pictures
        year
        alias
        bodyStyle{
          id
          name
        }
      }
    }
    """;

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
    if (createVehiclesResult.data != null) {
      return true;
    }

    return false;
  }
}
