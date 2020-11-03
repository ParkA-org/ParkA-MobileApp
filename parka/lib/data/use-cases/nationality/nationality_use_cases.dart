import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/nationality/nationality_data_model.dart';
import "package:ParkA/utils/graphql/queries/nationality_queries.dart";
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class NationalityUseCases {
  static Future<List<Nationality>> getAllNationalities() async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllNationalitiesQuery));

    final QueryResult getAllNationalitiesResult =
        await graphqlClient.query(queryOptions);

    if (getAllNationalitiesResult.data != null) {
      final nationalities = Nationality.nationalitiesFromJson(
          getAllNationalitiesResult.data["getAllNationalities"]);

      return nationalities;
    }

    return [];
  }
}
