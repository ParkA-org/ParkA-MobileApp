import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../../../components/Utils/graphql/graphql_client.dart';

// Aprendiendo con sebastiano faiella
Future Login(String user, String password) async {
  final local = "local";
  const loginMutation = r'''mutation(
    $identifier: String!
    $password: String!
    $provider: String = "local"
  ) {
    login(
      input: {
        identifier: $identifier
        password: $password
        provider: $provider
      }
    ) {
      jwt
      user {
        username
        email
        id
      }
    }
  } ''';

  MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(loginMutation),
      variables: <String, dynamic>{
        "input": {
          "data": {
            "identifier": user,
            "password": password,
            "provider": local,
          }
        }
      });

  final QueryResult mutationResult = await ParkaGraphqlClient.graphQlClient
      .mutate(mutationOptions)
      .then((value) {
    print(value.data);
    return value;
  });
}
