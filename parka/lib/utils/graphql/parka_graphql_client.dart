import 'package:ParkA/utils/graphql/auth-client/parka_auth_graphql_client.dart';
import 'package:ParkA/utils/graphql/public-client/parka_public_graphql_client.dart';
import "package:graphql/client.dart";

import "package:graphql/client.dart";

class ParkaGraphqlClient {
  GraphQLClient client;
  final HttpLink _httpLink = HttpLink(
    uri: 'http://10.0.0.134:3000/graphql',
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
    );
  }
}
