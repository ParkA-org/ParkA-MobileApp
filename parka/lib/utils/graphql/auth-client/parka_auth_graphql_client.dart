import 'package:flutter/cupertino.dart';
import "package:graphql/client.dart";

class AuthGraphqlClient {
  final String jwt;
  static GraphQLClient _client;

  static GraphQLClient get graphQlClient {
    return _client;
  }

  AuthGraphqlClient({
    @required this.jwt,
  }) {
    final HttpLink _httpLink = HttpLink(
      uri: 'http://10.0.0.134:3000/graphql',
    );

    final AuthLink _authLink = AuthLink(
      getToken: () async => 'Bearer ${this.jwt}',
    );

    final Link _link = _authLink.concat(_httpLink);

    _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );
  }
}
