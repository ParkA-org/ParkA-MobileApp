import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/color/color_data_model.dart';
import 'package:ParkA/utils/graphql/queries/color_queries.dart';

import 'package:get/get.dart';
import 'package:graphql/client.dart';

class ColorUseCases {
  static Future<List<Color>> getAllColors() async {
    final graphqlClient = Get.find<GraphqlClientController>();

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllColorsQuery));

    final QueryResult queryResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    if (queryResult != null) {
      print(queryResult.data["getAllColors"]);
      final colorsData = queryResult.data["getAllColors"];
      return Color.colorsFromJson(colorsData);
    }

    return [];
  }
}
