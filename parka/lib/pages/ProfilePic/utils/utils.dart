import 'package:graphql/client.dart';
import '../../../components/Utils/graphql/graphql_client.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

// Aprendiendo con sebastiano faiella
Future updateUser(String profileId, File file) async {
  print("testting open");

  const updateUser = r'''
  mutation UpdateUser($user: updateUserInput) {
    updateUser(input: $user) {
      user {
        id
      }
    }
  }''';

  final postUri = Uri.parse("https://parka-api.herokuapp.com/upload");

  http.MultipartRequest request = http.MultipartRequest('POST', postUri);

  http.MultipartFile multipartFile =
      await http.MultipartFile.fromPath('files', file.absolute.path);

  //final token = userDataSource.getToken();
  //if (token.isNotNullOrNotEmpty) {
  //request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
  //}

  print(multipartFile);
  request.files.add(multipartFile);
  print(request.files);
  final response = await request.send().then((value) {
    print(value);
    return value;
  });
  // if (response.statusCode != 200) throw ServerException();
  print(response);

  MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(updateUser),
      variables: <String, dynamic>{
        "user": {
          "data": {"profilepicture": profileId}
        }
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
