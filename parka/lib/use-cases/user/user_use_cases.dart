import 'package:ParkA/utils/graphql/public-client/parka_public_graphql_client.dart';
import 'package:graphql/client.dart';

class UserUseCases {
  static Future userLogin(String email, String password) async {
    final loginInput = {
      "input": {
        "email": "seb97@gmail.com",
        "password": "1234567890",
      }
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
        await PublicGraphqlClient.graphQlClient.mutate(loginMutationOptions);

    print(loginResult.data);
  }
}
