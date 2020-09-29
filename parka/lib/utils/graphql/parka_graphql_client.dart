import "package:graphql/client.dart";

class ParkaBaseGraphqlClient {
  static GraphQLClient _client;

  static GraphQLClient get graphQlClient {
    return _client;
  }

  ParkaBaseGraphqlClient() {
    final HttpLink _httpLink = HttpLink(
      uri: 'http://localhost:3000/graphql',
    );

    // final AuthLink _authLink = AuthLink(
    //   getToken: () async => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
    // );

    // final Link _link = _authLink.concat(_httpLink);

    _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _httpLink,
    );
  }
}
