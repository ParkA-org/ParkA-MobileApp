import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/country/country_data_model.dart';
import 'package:ParkA/utils/graphql/queries/country_queries.dart';

import 'package:get/get.dart';
import 'package:graphql/client.dart';

final graphqlClient =
    Get.find<GraphqlClientController>().parkaGraphqlClient.value.graphQlClient;

class CountryUseCases {
  static Future<List<Country>> getAllCountries() async {
    QueryOptions _queryOptions =
        QueryOptions(documentNode: gql(getAllCountriesQuery));

    final QueryResult _getAllCountriesResult =
        await graphqlClient.query(_queryOptions);

    if (_getAllCountriesResult != null) {
      return Country.countriesFromJson(
          _getAllCountriesResult.data['getAllCountries']);
    }

    return [];
  }
}
