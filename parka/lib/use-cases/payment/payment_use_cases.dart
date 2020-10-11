import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

final graphqlClient =
    Get.find<GraphqlClientController>().parkaGraphqlClient.value.graphQlClient;

class PaymentUseCases {
  static Future createPayment() async {
    String createPaymentQuery = r"""
    mutation($data:CreatePaymentInput!){
      createPayment(createPaymentInput:$data){
        cardHolder
        expirationDate
        digit
        activated  
      }
    }
    """;

    final createPaymentInput = {
      "data": {
        "cardHolder": "Tu Jeva",
        "expirationDate": "2020-10-02T02:05:30.962Z",
        "digit": "1234567812345678",
        "card": "",
        "cvv": "123"
      }
    };

    MutationOptions mutationOptions = MutationOptions(
      documentNode: gql(createPaymentQuery),
      variables: createPaymentInput,
    );

    final createPaymentInputResult =
        await graphqlClient.mutate(mutationOptions);

    if (createPaymentInputResult.data != null) {
      return createPaymentInputResult.data;
    }

    return null;
  }
}
