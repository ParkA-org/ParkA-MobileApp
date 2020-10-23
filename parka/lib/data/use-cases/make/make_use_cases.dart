import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/make/make_data_model.dart';
import 'package:ParkA/utils/graphql/queries/make_queries.dart';

import 'package:get/get.dart';
import 'package:graphql/client.dart';

class MakeUseCases {
  static Future<List<Make>> getAllMakes() async {
    final graphqlClient = Get.find<GraphqlClientController>();

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllMakesQuery));

    final QueryResult queryResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    print(queryResult.data);

    if (queryResult != null) {
      print(queryResult.data["getAllMakes"]);
      final List makesData = queryResult.data["getAllMakes"];

      return Make.makesFromJson(makesData);
    }

    return [];
  }
}
