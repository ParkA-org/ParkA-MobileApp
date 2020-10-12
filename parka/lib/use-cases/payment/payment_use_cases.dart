import 'package:ParkA/controllers/graphql_controller.dart';
import 'package:ParkA/data_models/payment/payment_data_model.dart';
import 'package:ParkA/use-cases/user/dtos/user_registration_dto.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

final graphqlClient =
    Get.find<GraphqlClientController>().parkaGraphqlClient.value.graphQlClient;

class PaymentUseCases {
  static Future createPayment(CreatePaymentDto createPaymentDto) async {
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
        "digit": "1234567816345671",
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

  static Future<List<Payment>> getAllUserPaymentMethods() async {
    String getAllUserPaymentMethods = r""" 
        query{
      getUserInformationById{
        id
        paymentInformation{
          id
          cardHolder
          expirationDate
          digit
          activated
          
        }
      }
    }
    """;

    QueryOptions queryOptions =
        QueryOptions(documentNode: gql(getAllUserPaymentMethods));

    final createPaymentInputResult = await graphqlClient.query(queryOptions);

    print(createPaymentInputResult.data);
    if (createPaymentInputResult.data != null) {
      return Payment.paymentsFromJson(createPaymentInputResult
          .data["getUserInformationById"]["paymentInformation"]);
    }

    return [];
  }
}
