import "package:graphql/client.dart";

class ParkaGraphqlClient {
  static GraphQLClient _client;

  static GraphQLClient get graphQlClient {
    return _client;
  }

  ParkaGraphqlClient() {
    final HttpLink _httpLink = HttpLink(
      uri: 'http://parka-api.herokuapp.com/graphql',
    );

// final AuthLink _authLink = AuthLink(
//     getToken: () async => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
// );

// final Link _link = _authLink.concat(_httpLink);

    _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _httpLink,
    );
  }
}
