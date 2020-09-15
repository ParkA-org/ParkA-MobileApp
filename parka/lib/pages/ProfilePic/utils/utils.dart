import 'package:graphql/client.dart';
import '../../../components/Utils/graphql/graphql_client.dart';

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

  List<String> countries = [];

  print('ok');
  print(result.data['countries'].length);
  for (var i = 0; i < result.data['countries'].length; i++) {
    String value = result.data['countries'][i]['name'];
    countries.add(value);
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

  List<String> documents = [];

  for (var i = 0; i < result.data['documentTypes'].length; i++) {
    String value = result.data['documentTypes'][i]['name'];
    documents.add(value);
    print(value);
  }
  return documents;
}
