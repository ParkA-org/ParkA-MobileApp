import 'package:ParkA/utils/graphql/parka_graphql_client.dart';
import 'package:get/state_manager.dart';

class GraphqlClientController extends GetxController {
  Rx<ParkaGraphqlClient> parkaGraphqlClient = ParkaGraphqlClient().obs;

  updateGraphqlClientwithJwt(String _jwt) {
    this.parkaGraphqlClient.update((val) {
      this.parkaGraphqlClient = ParkaGraphqlClient.fromJWT(_jwt).obs;
    });
  }

  removeGraphqlClientJwt() {
    this.parkaGraphqlClient.update((val) {
      this.parkaGraphqlClient = ParkaGraphqlClient().obs;
    });
  }
}
