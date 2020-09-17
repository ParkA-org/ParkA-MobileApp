import 'package:graphql/client.dart';
import '../../../components/Utils/graphql/graphql_client.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future createUser(Map<String, dynamic> createAccount) async {
  print(createAccount);
  final confirmed = true;
  const createUserMutation = r'''
  mutation CreateUser($user: createUserInput!) {
    createUser(input: $user) {
      user {
          id
          role{
            name
          }
      }
    }
  } ''';

  MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(createUserMutation),
      variables: <String, dynamic>{
        "user": {
          "data": {
            "username": createAccount["registerpage"]["email"],
            "name": createAccount["registerpage"]["username"],
            "password": createAccount["registerpage"]["password"],
            "lastname": createAccount["registerpage"]["lastname"],
            "confirmed": confirmed,
            "email": createAccount["registerpage"]["email"]
          }
        }
      });

  final QueryResult mutationResult = await ParkaGraphqlClient.graphQlClient
      .mutate(mutationOptions)
      .then((value) {
    print(value.data);
    return value;
  }).catchError((value) {
    return value;
  });

  String profileId = mutationResult.data["createUser"]["user"]["id"];
  print(profileId);
  if (createAccount["profilepage"]["pictures"] == "null" ||
      createAccount["profilepage"]["pictures"] == null) {
    createAccountData(createAccount, profileId);
  } else {
    File imageFile = File(createAccount["profilepage"]["pictures"]);
    updateUser(profileId, imageFile, createAccount);
  }
}

Future updateUser(String profileId, File imageFile,
    Map<String, dynamic> createAccount) async {
  const updateUser = r'''
  mutation UpdateUser($user: updateUserInput) {
    updateUser(input: $user) {
      user {
        id
      }
    }
  }''';

  final postUri = Uri.parse("https://parka-api.herokuapp.com/upload");

  http.MultipartRequest request = http.MultipartRequest('POST', postUri);

  http.MultipartFile multipartFile =
      await http.MultipartFile.fromPath('files', imageFile.path);

  //final token = userDataSource.getToken();
  //if (token.isNotNullOrNotEmpty) {
  //request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
  //}
  request.files.add(multipartFile);
  http.StreamedResponse stream = await request.send();
  print(stream.statusCode);
  http.Response response = await http.Response.fromStream(stream);
  final responseJson = json.decode(response.body);
  var url = responseJson[0]['url'];

  MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(updateUser),
      variables: <String, dynamic>{
        "user": {
          "where": {"id": profileId},
          "data": {"profilepicture": url}
        }
      });

  final QueryResult mutationResult = await ParkaGraphqlClient.graphQlClient
      .mutate(mutationOptions)
      .then((value) {
    print(value.data);
    return value;
  }).catchError((value) {
    return value;
  });

  createAccountData(createAccount, profileId);
}

Future createAccountData(
    Map<String, dynamic> createAccount, String profileId) async {
  String accountID = "";
  const createNewAccountMutation = r'''
  mutation createNewAccount($userAccount: createAccountDatumInput){
  createAccountDatum(input: $userAccount){
    accountDatum{
      id
      document_type
      placeofbirth
      user{
        id
      }
      document
    }
  }
} ''';

  MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(createNewAccountMutation),
      variables: <String, dynamic>{
        "userAccount": {
          "data": {
            "document": createAccount["idpage"]["document"],
            "user": profileId,
            "nationality": createAccount["idpage"]["nationality"],
            "document_type": createAccount["idpage"]["typeDocument"],
            "datebirth": createAccount["idpage"]["datebirth"],
            "placeofbirth": createAccount["idpage"]["Placeofbirth"],
            "phone": createAccount["registerpage"]["phone"],
          }
        }
      });

  final QueryResult mutationResult = await ParkaGraphqlClient.graphQlClient
      .mutate(mutationOptions)
      .then((value) {
    print(value.data);
    return value;
  }).catchError((value) {
    return value;
  });

  accountID = mutationResult.data["createAccountDatum"]["accountDatum"]["id"];

  createPaymentInformation(createAccount, profileId, accountID);
}

Future createPaymentInformation(
    Map<String, dynamic> createAccount, String id, String accountId) async {
  if (createAccount["paymentpage"]["digit"] == 0) {
    return id;
  }

  const createPaymentMutation = r'''
  mutation createNewPayment($userPaymentInfo: createPaymentInformationInput) {
  createPaymentInformation(input: $userPaymentInfo){
    paymentInformation {
      id
      name
    }
  }
 } ''';

  MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(createPaymentMutation),
      variables: <String, dynamic>{
        "userPaymentInfo": {
          "data": {
            "expirationdate": createAccount["paymentpage"]["expirationdate"],
            "digit": createAccount["paymentpage"]["digit"],
            "name": createAccount["paymentpage"]["name"],
            "account_data": accountId,
            "activate": true
          }
        }
      });

  final QueryResult mutationResult = await ParkaGraphqlClient.graphQlClient
      .mutate(mutationOptions)
      .then((value) {
    print(value.data);
    return value;
  }).catchError((value) {
    return value;
  });

  return id;
}
