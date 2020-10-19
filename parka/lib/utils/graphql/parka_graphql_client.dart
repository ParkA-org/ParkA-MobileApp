import "package:graphql/client.dart";

class ParkaGraphqlClient {
  GraphQLClient client;

  GraphQLClient get graphQlClient {
    return client;
  }

  ParkaGraphqlClient() {
    final HttpLink _httpLink = HttpLink(
      uri: 'http://206.189.201.90/graphql',
    );
    this.client = GraphQLClient(
      cache: InMemoryCache(),
      link: _httpLink,
    );
  }

  ParkaGraphqlClient.fromJWT(String jwt) {
    final AuthLink _authLink = new AuthLink(
      getToken: () => 'Bearer $jwt',
    );
    final HttpLink _httpLink = HttpLink(
      uri: 'http://206.189.201.90/graphql',
    );

    final Link _link = _authLink.concat(_httpLink);

    final policies = Policies(
      fetch: FetchPolicy.networkOnly,
    );

    this.client = GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
      defaultPolicies: DefaultPolicies(
        watchQuery: policies,
        query: policies,
        mutate: policies,
      ),
    );
  }
}
