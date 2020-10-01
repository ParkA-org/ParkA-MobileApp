import 'package:ParkA/data_models/user/user_data_model.dart';
import 'package:ParkA/utils/graphql/public-client/parka_public_graphql_client.dart';
import 'package:graphql/client.dart';

class UserUseCases {
  static Future userLogin(String email, String password) async {
    final loginInput = {
      "input": {
        "email": email,
        "password": password,
      }
    };

    final String loginMutation = r'''
    mutation($input:LoginUserInput!){
      login(loginUserInput:$input){
        JWT,
        user{
          name
          email
          lastName
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

    print(loginResult.data["login"]);

    final userData = loginResult.data["login"]['user'];

    return User(name: userData["name"], lastName: userData['lastName']);
  }
}
