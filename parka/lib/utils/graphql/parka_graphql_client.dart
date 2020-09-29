import 'package:ParkA/utils/graphql/auth-client/parka_auth_graphql_client.dart';
import 'package:ParkA/utils/graphql/public-client/parka_public_graphql_client.dart';
import "package:graphql/client.dart";

class ParkaGraphqlClient {
  PublicGraphqlClient _publicClient;
  AuthGraphqlClient _authClient;

  PublicGraphqlClient get publicGraphQlClient {
    return _publicClient;
  }

  AuthGraphqlClient get suthGraphqlClient {
    return _authClient;
  }

  ParkaGraphqlClient() {
    _publicClient = new PublicGraphqlClient();
  }
}
