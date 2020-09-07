import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../../../components/Utils/graphql/graphql_client.dart';

// Aprendiendo con sebastiano faiella
Future createUser(
    String name, String lastname, String email, String password) async {
  final confirmed = true;
  const createUserMutation = r'''
  mutation CreateUser($user: createUserInput!) {
    createUser(input: $user) {
      user {
          id
          role{
            name
          }
      }
    }
  } ''';

  MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(createUserMutation),
      variables: <String, dynamic>{
        "username": name,
        "password": password,
        "lastname": lastname,
        "confirmed": confirmed,
        "email": email
      });

  final QueryResult mutationResult = await ParkaGraphqlClient.graphQlClient
      .mutate(mutationOptions)
      .then((value) {
    print(value.data);
    return value;
  }).catchError((value) {
    return value;
  });

  return mutationResult;
}
