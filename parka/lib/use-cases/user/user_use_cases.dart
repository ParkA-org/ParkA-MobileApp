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

  static Future createUser() async {
    String createUserQuery = r"""
    mutation($data:createUserInput!){
      createUser(createUserInput:$data){
        name
        lastName
        email
        profilePicture
        confirmed
        origin
      }
    }
    """;

    final createUserInput = {
      "data": {
        "name": "Sebatiano",
        "lastName": "Faiella",
        "origin": "mobile",
        "email": "sebyfaiella97@gmail.com",
        "profilePicture":
            "https://mangathrill.com/wp-content/uploads/2020/02/5432111-1.jpg",
        "password": "1234567890",
        "userInformation": "f5ff06b9-6057-44ed-8404-6191d023a65c"
      }
    };

    MutationOptions mutationOptions = MutationOptions(
        documentNode: gql(createUserQuery), variables: createUserInput);

    final QueryResult createUserResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    if (createUserResult.data != null) {
      return createUserResult.data;
    }

    return null;
  }

  static Future createUserInformation() async {
    String createUserInformation = r"""
    mutation($data:CreateUserInformationInpuType!) {
  createUserInformation(
    createUserInformationInpuType: $data
  ) {
    id
    documentNumber
    telephoneNumber
    birthDate
    placeOfBirth {
      name
    }
    nationality {
      id
      name
    }
  }
}
    """;

    final createUserInformationInput = {
      "data": {
        "paymentInformation": "",
        "documentNumber": "",
        "telephoneNumber": "",
        "birthDate": "",
        "placeOfBirth": "",
        "nationality": ""
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(createUserInformation),
      variables: createUserInformationInput,
    );

    final QueryResult createUserInformationResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    if (createUserInformationResult.data != null) {
      return createUserInformationResult.data;
    }

    return null;
  }
}
