import "package:graphql/client.dart";

class ParkaGraphqlClient {
  GraphQLClient client;
  final HttpLink _httpLink = HttpLink(
    uri: 'http://ec2-3-236-57-220.compute-1.amazonaws.com/graphql',
  );

  GraphQLClient get graphQlClient {
    return client;
  }

  ParkaGraphqlClient() {
    this.client = GraphQLClient(
      cache: InMemoryCache(),
      link: this._httpLink,
    );
  }

  ParkaGraphqlClient.fromJWT(String jwt) {
    final AuthLink _authLink = AuthLink(
      getToken: () async => 'Bearer $jwt',
    );

    final Link _link = _authLink.concat(_httpLink);

    this.client = GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.noCache,
        ),
      ),
    );
  }
}
