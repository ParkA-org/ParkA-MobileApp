import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data_models/user/user_data_model.dart';
import 'package:ParkA/use-cases/user/dtos/user_registration_dto.dart';
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

  static Future createUser(CreateUserDto createUserDto) async {
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
        "name": createUserDto.name,
        "lastName": createUserDto.lastName,
        "origin": "mobile",
        "email": createUserDto.email,
        "password": createUserDto.password,
        "profilePicture":
            "https://mangathrill.com/wp-content/uploads/2020/02/5432111-1.jpg",
        "userInformation": createUserDto.userInformation,
      }
    };

    MutationOptions mutationOptions = MutationOptions(
        documentNode: gql(createUserQuery), variables: createUserInput);

    final QueryResult createUserResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    print(createUserResult.data);

    if (createUserResult.data != null) {
      return createUserResult.data;
    }

    return null;
  }

  static Future createUserInformation(
      CreateUserInformationDto createUserInformationDto) async {
    final graphqlClient = Get.find<GraphqlClientController>();

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
        "paymentInformation": "cc78a504-aafe-4917-afe9-f3a3ecee8b07",
        "documentNumber": createUserInformationDto.documentNumber,
        "telephoneNumber": createUserInformationDto.telephonNumber,
        "birthDate": createUserInformationDto.birthDate,
        "placeOfBirth": createUserInformationDto.placeOfBirth,
        "nationality": createUserInformationDto.nationality,
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(createUserInformation),
      variables: createUserInformationInput,
    );

    final QueryResult createUserInformationResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions)
        .catchError((error) => {print(error)});

    print(createUserInformationResult.data);
    print(createUserInformationResult.exception);

    if (createUserInformationResult.data != null) {
      return createUserInformationResult.data["createUserInformation"];
    }

    return null;
  }

  static Future registerUser(UserRegistrationForm userRegistrationForm) async {
    final createUserInformationResult = await createUserInformation(
        userRegistrationForm.createUserInformationDto);

    userRegistrationForm.createUserDto.userInformation =
        createUserInformationResult["id"];

    final createUserResult =
        await createUser(userRegistrationForm.createUserDto);
  }
}
