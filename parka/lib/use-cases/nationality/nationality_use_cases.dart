import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data_models/nationality/nationality_data_model.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

final graphqlClient =
    Get.find<GraphqlClientController>().parkaGraphqlClient.value.graphQlClient;

class NationalityUseCases {
  static Future<List<Nationality>> getAllNationalities() async {
    final String getAllNationalities = r"""
      query{
          getAllNationalities{
            id
            name
          }
        }
    """;

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllNationalities));

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
