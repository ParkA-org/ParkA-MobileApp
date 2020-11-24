import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data/data-models/payment/payment_data_model.dart';
import 'package:ParkA/data/dtos/payment/create_payment_dto.dart';
import 'package:ParkA/data/dtos/payment/update_payment_dto.dart';
import 'package:ParkA/utils/graphql/mutations/payment_mutations.dart';
import 'package:ParkA/utils/graphql/queries/payment_queries.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

class PaymentUseCases {
  static Future createPayment(CreatePaymentDto createPaymentDto) async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    print(createPaymentDto.cardHolder);
    print(createPaymentDto.card);
    print(createPaymentDto.expirationDate);
    print(createPaymentDto.cvv);
    print(createPaymentDto.digit);

    final createPaymentInput = {
      "data": {
        "cardHolder": createPaymentDto.cardHolder,
        "expirationDate": createPaymentDto.expirationDate + "T00:00:00.000Z",
        "digit": createPaymentDto.digit,
        "card": "",
        "cvv": createPaymentDto.cvv,
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(createPaymentMutation),
      variables: createPaymentInput,
    );

    final createPaymentInputResult =
        await graphqlClient.mutate(mutationOptions);

    if (createPaymentInputResult.data != null) {
      print("created");
      return true;
    }

    return false;
  }

  static Future updatePayment(UpdatePaymentDto updatePaymentDto) async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;
    if (updatePaymentDto.expirationDate.length <= 10) {
      updatePaymentDto.expirationDate += "T00:00:00.000Z";
    }

    final updatePaymentInput = {
      "data": {
        "id": updatePaymentDto.id,
        "expirationDate": updatePaymentDto.expirationDate,
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(updatePaymentMutation),
      variables: updatePaymentInput,
    );

    final updatePaymentInputResult =
        await graphqlClient.mutate(mutationOptions);

    if (updatePaymentInputResult.data != null) {
      return true;
    }

    return false;
  }

  static Future<List<Payment>> getAllUserPaymentMethods() async {
    final graphqlClient = Get.find<GraphqlClientController>()
        .parkaGraphqlClient
        .value
        .graphQlClient;

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllUserPaymentMethodsQuery));

    final createPaymentInputResult = await graphqlClient.query(queryOptions);

    print(createPaymentInputResult.data);
    if (createPaymentInputResult.data != null) {
      return Payment.paymentsFromJson(createPaymentInputResult
          .data["getUserInformationById"]["paymentInformation"]);
    }

    return [];
  }
}
