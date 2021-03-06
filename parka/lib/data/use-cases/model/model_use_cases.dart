import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/model/model_data_model.dart';
import 'package:ParkA/utils/graphql/queries/model_queries.dart';

import 'package:get/get.dart';
import 'package:graphql/client.dart';

class ModelUseCases {
  static Future<List<Model>> getAllModels() async {
    final graphqlClient = Get.find<GraphqlClientController>();

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllModelsQuery));

    final QueryResult queryResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    print(queryResult.data);

    if (queryResult != null) {
      print(queryResult.data["getAllMakes"]);
      final List tempList = queryResult.data["getAllMakes"];

      List modelsData = List();
      tempList.forEach((element) {
        modelsData = [...modelsData, ...element["models"]];
      });

      return Model.modelsFromJson(modelsData);
    }

    return [];
  }
}
