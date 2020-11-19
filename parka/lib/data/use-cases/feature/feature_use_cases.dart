import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/feature/parking_feature_data_model.dart';
import 'package:ParkA/utils/graphql/queries/feature_queries.dart';

import 'package:get/get.dart';
import 'package:graphql/client.dart';

class FeatureUseCases {
  static Future<List<Feature>> getAllFeatures() async {
    final graphqlClient = Get.find<GraphqlClientController>();

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllFeaturesQuery));

    final QueryResult queryResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    if (queryResult != null) {
      print(queryResult.data["getAllFeatures"]);
      final featuresData = queryResult.data["getAllFeatures"];
      return Feature.featuresFromJson(featuresData);
    }

    return [];
  }
}
