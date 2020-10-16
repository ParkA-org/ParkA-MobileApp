import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data_models/bodyStyle/body_style_data_model.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class BodyStyleUseCases {
  static Future<List<BodyStyle>> getAllBodyStyles() async {
    final graphqlClient = Get.find<GraphqlClientController>();
    String getAllBodyStylesQuery = r"""
    query{
      getAllBodyStyles{
        id
        name
      }
    }
    """;

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllBodyStylesQuery));

    final QueryResult queryResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    if (queryResult != null) {
      print(queryResult.data["getAllBodyStyles"]);
      final bodyStylesData = queryResult.data["getAllBodyStyles"];
      return BodyStyle.bodyStylesFromJson(bodyStylesData);
    }

    return [];
  }
}
