import "package:graphql/client.dart";

class PublicGraphqlClient {
  static GraphQLClient _client;

  static GraphQLClient get graphQlClient {
    return _client;
  }

  PublicGraphqlClient() {
    final HttpLink _httpLink = HttpLink(
      uri: 'http://localhost:3000/graphql',
    );

    _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _httpLink,
    );
  }
}
