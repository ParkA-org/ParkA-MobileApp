import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data_models/user/user_data_model.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

final graphqlClient = Get.find<GraphqlClientController>();

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
          profilePicture
          }
        }
      }
    ''';

    MutationOptions loginMutationOptions = MutationOptions(
      documentNode: gql(loginMutation),
      variables: loginInput,
    );

    final QueryResult loginResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(loginMutationOptions);

    print(loginResult.data);
    print(loginResult.exception);

    if (loginResult.data != null) {
      graphqlClient
          .updateGraphqlClientwithJwt(loginResult.data["login"]["JWT"]);

      final userData = loginResult.data["login"]['user'];
      print(userData);
      return User(
        name: userData["name"],
        lastName: userData['lastName'],
        email: userData['email'],
        profilePicture: userData["profilePicture"],
      );
    }

    return null;
  }
}
