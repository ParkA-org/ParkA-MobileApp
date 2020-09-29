import 'package:ParkA/utils/graphql/parka_graphql_client.dart';
import 'package:graphql/client.dart';

class UserUseCases {
  Future userLogin(String email, String password) async {
    final loginInput = {
      "input": {"email": "seb97@gmail.com", "password": "1234567890"}
    };

    final String loginMutation = r'''
    mutation($input:LoginUserInput!){
      login(loginUserInput:$input){
        JWT,
        user{
          name
          email
          }
        }
      }
    ''';

    MutationOptions loginMutationOptions = MutationOptions(
      documentNode: gql(loginMutation),
      variables: loginInput,
    );

    final QueryResult loginResult =
        await ParkaBaseGraphqlClient.graphQlClient.mutate(loginMutationOptions);
  }
}
