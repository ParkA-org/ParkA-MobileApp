import 'package:ParkA/components/Utils/graphql/graphql_client.dart';
import "package:flutter/material.dart";
import 'package:graphql/client.dart';

class GraphqlTestScreen extends StatefulWidget {
  static String routeName = "/testPage";

  @override
  _GraphqlTestScreenState createState() => _GraphqlTestScreenState();
}

var variables = <String, dynamic>{
  "input": {
    "data": {"name": "blanco pero desde flutter"}
  }
};

class _GraphqlTestScreenState extends State<GraphqlTestScreen> {
  Future<dynamic> getData() async {
    //this way you define a query
    String getColors = r'''
          query{
        colorExteriors{
          name
        }
      }
    ''';

    //this way you create a QueryOptions instance to send your query
    QueryOptions options = QueryOptions(documentNode: gql(getColors));

    //store the result of your query calling the static client property
    // and the method query passing the query options created above
    final QueryResult result =
        await ParkaGraphqlClient.graphQlClient.query(options).then((value) {
      // print the data you got from the api
      print(value.data);
      return value;
    });

    String createColor = r'''
    mutation($input:createColorExteriorInput){
  createColorExterior(input:$input){
    colorExterior{
      name
    }
  }
}
    ''';

    //this way you create a MutationOptions instance to send your mutation
    //with your variables
    MutationOptions mutationOptions = MutationOptions(
        documentNode: gql(createColor),
        variables: <String, dynamic>{
          "input": {
            "data": {"name": "blanco pero desde flutter"}
          }
        });

    //this way you send your mutation to the api
    final QueryResult mutationResult = await ParkaGraphqlClient.graphQlClient
        .mutate(mutationOptions)
        .then((value) {
      print(value.data);
      return value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await this.getData();
        },
      ),
      body: Container(
        child: Center(
          child: Text("GraphQl test"),
        ),
      ),
    );
  }
}
