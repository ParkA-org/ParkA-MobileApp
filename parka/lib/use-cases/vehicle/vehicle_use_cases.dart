import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

final graphqlClient = Get.find<GraphqlClientController>();

class VehicleUseCases {
  static getAllUserVehicles() async {
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

    if (getAllUserVehiclesResult.data != null) {}

    return [];
  }
}
