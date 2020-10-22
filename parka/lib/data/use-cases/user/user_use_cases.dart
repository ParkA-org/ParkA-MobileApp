import 'dart:convert';

import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/information/information_data_model.dart';
import 'package:ParkA/data/data-models/user/user_data_model.dart';
import 'package:ParkA/utils/functions/upload_image.dart';
import 'package:ParkA/utils/graphql/mutations/user_mutations.dart';
import 'package:ParkA/utils/graphql/queries/user_queries.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;

import '../../dtos/user/user_registration_dto.dart';

class UserUseCases {
  static Future userLogin(String email, String password) async {
    final graphqlClient = Get.find<GraphqlClientController>();

    final loginInput = {
      "input": {
        "email": email,
        "password": password,
      }
    };

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
    final graphqlClient = Get.find<GraphqlClientController>();

    final createUserInput = {
      "data": {
        "name": createUserDto.name,
        "lastName": createUserDto.lastName,
        "origin": "mobile",
        "email": createUserDto.email,
        "password": createUserDto.password,
        "userInformation": createUserDto.userInformation,
      }
    };

    if (createUserDto.profilePicture != null) {
      createUserInput["data"]["profilePicture"] =
          await uploadImage(createUserDto.profilePicture);
    }

    MutationOptions mutationOptions = MutationOptions(
        documentNode: gql(createUserMutation), variables: createUserInput);

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
      documentNode: gql(createUserInformationMutation),
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

    final confirmUserEmailInput = {
      "data": {
        "email": email,
        "origin": "mobile",
        "code": code,
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(confirmUserEmailMutation),
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

    final resendConfirmationInput = {
      "data": {
        "email": email,
        "origin": "mobile",
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(resendConfirmationCodeMutation),
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

    final resetPasswordInput = {
      "data": {
        "email": email,
        "origin": "mobile",
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(requestResetPasswordMutation),
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

    final resetPasswordInput = {
      "data": {
        "email": email,
        "origin": "mobile",
        "code": code,
        "newPassword": password,
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(resetPasswordMutation),
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
