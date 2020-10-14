import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data_models/country/country_data_model.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

final graphqlClient =
    Get.find<GraphqlClientController>().parkaGraphqlClient.value.graphQlClient;

class CountryUseCases {
  static Future<List<Country>> getAllCountries() async {
    final String _getAllCountriesQuery = r"""
        query{
      getAllCountries{
        id
        name
      }
    }
    """;

    QueryOptions _queryOptions =
        QueryOptions(documentNode: gql(_getAllCountriesQuery));

    final QueryResult _getAllCountriesResult =
        await graphqlClient.query(_queryOptions);

    if (_getAllCountriesResult != null) {
      return Country.countriesFromJson(
          _getAllCountriesResult.data['getAllCountries']);
    }

    return [];
  }
}
