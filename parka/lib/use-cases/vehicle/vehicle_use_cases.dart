import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data_models/vehicle/dto/create_vehicle_dto.dart';
import 'package:ParkA/data_models/vehicle/vehicle_data_model.dart';
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

    final createVehicleInput = {
      "data": {
        "model": "62f7c63e-d637-4e05-a2c3-41df339dc33d",
        "licensePlate": "1234567",
        "colorExterior": "16532e68-b1bd-4506-9f6c-36d2e03bd014",
        "mainPicture": "",
        "pictures": [],
        "year": "2008",
        "alias": "un nuevo carro",
        "bodyStyle": "801a007d-4087-4a98-8ac2-3e39f47d6a7e"
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
      return false;
    }

    return true;
  }
}
