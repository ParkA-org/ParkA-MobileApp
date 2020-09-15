import 'dart:convert';
import 'dart:html';
import 'package:graphql/client.dart';
import '../../../components/Utils/graphql/graphql_client.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

Future getCountries() async {
  String getCountries = r'''
          query{
        countries{
          name
        }
      }
    ''';

  //this way you create a QueryOptions instance to send your query
  QueryOptions options = QueryOptions(documentNode: gql(getCountries));

  //store the result of your query calling the static client property
  // and the method query passing the query options created above
  final QueryResult result =
      await ParkaGraphqlClient.graphQlClient.query(options).then((value) {
    // print the data you got from the api
    print(value.data);
    return value;
  });

  List<String> countries;

  for (var i = 0; i < result.data['countries'].length(); i++) {
    String value = result.data['countries'][i]['name'];
    countries.add(value);
    print(value);
  }
  return countries;
}

Future getTypeDocument() async {
  String getDocumentTypes = r'''
          query{
        documentTypes{
          name
        }
      }
    ''';

  //this way you create a QueryOptions instance to send your query
  QueryOptions options = QueryOptions(documentNode: gql(getDocumentTypes));

  //store the result of your query calling the static client property
  // and the method query passing the query options created above
  final QueryResult result =
      await ParkaGraphqlClient.graphQlClient.query(options).then((value) {
    // print the data you got from the api
    print(value.data);
    return value;
  });

  List<String> documents;

  for (var i = 0; i < result.data['documentTypes'].length(); i++) {
    String value = result.data['documentTypes'][i]['name'];
    documents.add(value);
    print(value);
  }
  return documents;
}

// Future updateUser(String profileId, File imageFile) async {
//   const updateUser = r'''
//   mutation UpdateUser($user: updateUserInput) {
//     updateUser(input: $user) {
//       user {
//         id
//       }
//     }
//   }''';

//   final postUri = Uri.parse("https://parka-api.herokuapp.com/upload");

//   http.MultipartRequest request = http.MultipartRequest('POST', postUri);

//   http.MultipartFile multipartFile =
//       await http.MultipartFile.fromPath('files', imageFile.path);

//   //final token = userDataSource.getToken();
//   //if (token.isNotNullOrNotEmpty) {
//   //request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
//   //}
//   request.files.add(multipartFile);
//   http.StreamedResponse stream = await request.send();
//   print(stream.statusCode);
//   http.Response response = await http.Response.fromStream(stream);
//   final responseJson = json.decode(response.body);
//   var url = responseJson[0]['url'];

//   MutationOptions mutationOptions = MutationOptions(
//       documentNode: gql(updateUser),
//       variables: <String, dynamic>{
//         "user": {
//           "where": {"id": profileId},
//           "data": {"profilepicture": url}
//         }
//       });

//   final QueryResult mutationResult = await ParkaGraphqlClient.graphQlClient
//       .mutate(mutationOptions)
//       .then((value) {
//     print(value.data);
//     return value;
//   }).catchError((value) {
//     return value;
//   });

//   return mutationResult;
// }
