import 'dart:convert';

import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data_models/information/information_data_model.dart';
import 'package:ParkA/data_models/user/user_data_model.dart';
import 'package:ParkA/use-cases/user/dtos/user_registration_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;

class UserUseCases {
  static Future userLogin(String email, String password) async {
    final graphqlClient = Get.find<GraphqlClientController>();

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

  static Future<String> uploadImage(String imagePath) async {
    print("LOADING IMAGE");

    final postUri = Uri.parse("https://parka-api.herokuapp.com/upload");

    http.MultipartRequest request = http.MultipartRequest('POST', postUri);

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('files', imagePath);

    request.files.add(multipartFile);
    http.StreamedResponse stream = await request.send();
    print(stream.statusCode);
    http.Response response = await http.Response.fromStream(stream);

    final responseJson = json.decode(response.body);
    final url = responseJson[0]['url'];
    print("SUCCESS ???");
    print(url);
    return url;
  }

  static Future createUser(CreateUserDto createUserDto) async {
    final graphqlClient = Get.find<GraphqlClientController>();

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
        // "profilePicture": _imageUrl,
        "userInformation": createUserDto.userInformation,
      }
    };

    if (createUserDto.profilePicture != null) {
      createUserInput["data"]["profilePicture"] =
          await UserUseCases.uploadImage(createUserDto.profilePicture);
    }

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
        .mutate(mutationOptions);

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

  static Future confirmUserEmail({String email, String code}) async {
    final graphqlClient = Get.find<GraphqlClientController>();
    String confirmUserEmail = r"""
    mutation($data:ValidateEmailCodeInput!){
      validateEmailCode(validateEmailCodeInput:$data){
        email
        origin
      }
    }""";

    final confirmUserEmailInput = {
      "data": {
        "email": email,
        "origin": "mobile",
        "code": code,
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(confirmUserEmail),
      variables: confirmUserEmailInput,
    );

    final QueryResult confirmUserEmailResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    print(confirmUserEmailResult.data);
    if (confirmUserEmailResult.data != null) {
      return true;
    }

    return false;
  }

  static Future resendConfirmationCode({String email}) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    String resendConfirmationCodeQuery = r"""
    mutation($data:ValidateEmailCodeInput!){
      validateEmailCode(validateEmailCodeInput:$data){
        email
        origin
      }
    }""";

    final resendConfirmationInput = {
      "data": {
        "email": email,
        "origin": "mobile",
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(resendConfirmationCodeQuery),
      variables: resendConfirmationInput,
    );

    final QueryResult resendConfirmationResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    if (resendConfirmationResult.data != null) {
      return true;
    }

    return false;
  }

  static Future requestResetPassword({String email}) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    String resetPasswordQuery = r"""
    mutation($data:ResetPasswordInput!){
      resetPassword(resetPasswordInput:$data){
        email
        origin
      }
    }
    """;

    final resetPasswordInput = {
      "data": {
        "email": email,
        "origin": "mobile",
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(resetPasswordQuery),
      variables: resetPasswordInput,
    );

    final QueryResult resetPasswordResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    print(resetPasswordResult.data);
    if (resetPasswordResult.data != null) {
      return true;
    }

    return false;
  }

  static Future resetPassword({
    @required String email,
    @required String code,
    @required String password,
  }) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    final resetPasswordQuery = r'''
    mutation($data:ValidateResetPasswordCodeInput!){
      validateResetPasswordCode(validateResetPasswordCodeInput:$data){
        email
        origin
      }
    }
    ''';

    final resetPasswordInput = {
      "data": {
        "email": email,
        "origin": "mobile",
        "code": code,
        "newPassword": password,
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(resetPasswordQuery),
      variables: resetPasswordInput,
    );

    final QueryResult resetPasswordResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    print(resetPasswordResult.data);
    if (resetPasswordResult.data != null) {
      return true;
    }

    return false;
  }

  static Future updateUserPassword(
      {String newPassword, String oldPassword}) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    String updateUserPasswordMutation = r"""
    mutation($data:UpdateUserPasswordInput!){
  updateUserPassword(updateUserPasswordInput:$data){
    email
  }
}
    """;

    final updateUserPasswordInput = {
      "data": {
        "newPassword": newPassword,
        "oldPassword": oldPassword,
      }
    };

    MutationOptions mutationOptions = new MutationOptions(
      documentNode: gql(updateUserPasswordMutation),
      variables: updateUserPasswordInput,
    );

    final QueryResult updateUserPasswordResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    print(updateUserPasswordResult.data);
    if (updateUserPasswordResult.data != null) {
      return true;
    }

    return false;
  }

  static Future<User> updateUser({
    String name,
    String lastName,
  }) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    String updateUserMutation = r'''
     mutation($data:UpdateUserInput!){
      updateUser(updateUserInput:$data){
        name
        lastName
        email
        profilePicture
        confirmed
        origin
      }
    }''';

    final updateUserInput = {
      "data": {
        "origin": "mobile",
      }
    };

    if (name != null) {
      updateUserInput["data"]["name"] = name;
    }

    if (lastName != null) {
      updateUserInput["data"]["lastName"] = lastName;
    }

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(updateUserMutation),
      variables: updateUserInput,
    );

    QueryResult updateUserResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    if (updateUserResult.data != null) {
      final userUpdatedData = updateUserResult.data['updateUser'];
      print(userUpdatedData);
      return User(
        name: userUpdatedData["name"],
        lastName: userUpdatedData['lastName'],
        email: userUpdatedData['email'],
        profilePicture: userUpdatedData["profilePicture"],
      );
    }

    return null;
  }

  static Future<Information> getUserInformation() async {
    final graphqlClient = Get.find<GraphqlClientController>();

    String getUserInformationQuery = r"""
      query{
        getUserInformationById{
          id
          documentNumber
          telephoneNumber
          birthDate
          placeOfBirth{
            name
          }
          nationality{
            name
          }
        }
      }
      """;

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getUserInformationQuery));

    QueryResult queryResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .query(queryOptions);

    print(queryResult.data);
    if (queryResult.data != null) {
      final userInformationData = queryResult.data["getUserInformationById"];

      return Information(
        id: userInformationData["id"],
        document: userInformationData["documentNumber"],
        telephoneNumber: userInformationData["telephoneNumber"],
        dateBirth: userInformationData["birthDate"],
        placeOfBirth: userInformationData["placeOfBirth"]["name"],
        nationality: userInformationData["nationality"]["name"],
      );
    }

    return null;
  }

  static Future<bool> updateUserInformation(
    String documentNumber,
    String birthDate,
    String placeOfBirth,
    String nationality,
  ) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    final String updateUserInformationMutation = r"""
    mutation($data:updateUserInformationInput!){
      updateUserInformation(updateUserInformationInput:$data){
        documentNumber
        telephoneNumber
        birthDate
        placeOfBirth{
          name
        }
        nationality{
          name
        }
      }
    }
    """;

    print(nationality);
    print(placeOfBirth);

    final updateUserInformationInput = {
      "data": {
        "paymentInformation": "1f6273ac-a3f0-432c-8876-8ae8881668d0",
      }
    };

    if (documentNumber != null) {
      updateUserInformationInput["data"]['documentNumber'] = documentNumber;
    }

    if (birthDate != null) {
      updateUserInformationInput["data"]['birthDate'] = birthDate;
    }

    if (placeOfBirth != null) {
      updateUserInformationInput["data"]['placeOfBirth'] = placeOfBirth;
    }

    if (nationality != null) {
      updateUserInformationInput["data"]['nationality'] = nationality;
    }

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(updateUserInformationMutation),
      variables: updateUserInformationInput,
    );

    QueryResult updateUserInformationResult = await graphqlClient
        .parkaGraphqlClient.value.graphQlClient
        .mutate(mutationOptions);

    if (updateUserInformationResult.data != null) {
      final updateUserInformationData =
          updateUserInformationResult.data['updateUserInformation'];
      print(updateUserInformationData);

      Information(
        id: updateUserInformationData["id"],
        document: updateUserInformationData["documentNumber"],
        telephoneNumber: updateUserInformationData["telephoneNumber"],
        dateBirth: updateUserInformationData["birthDate"],
        placeOfBirth: updateUserInformationData["placeOfBirth"]["name"],
        nationality: updateUserInformationData["nationality"]["name"],
      );

      print("SENT");

      return true;
    }

    return false;
  }
}
