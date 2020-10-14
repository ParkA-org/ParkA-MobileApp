import 'package:ParkA/utils/graphql/parka_graphql_client.dart';
import 'package:get/state_manager.dart';

class GraphqlClientController extends GetxController {
  Rx<ParkaGraphqlClient> parkaGraphqlClient = new ParkaGraphqlClient().obs;

  updateGraphqlClientwithJwt(String _jwt) {
    print(_jwt);
    parkaGraphqlClient.update((val) {
      this.parkaGraphqlClient = null.obs;
      this.parkaGraphqlClient = new ParkaGraphqlClient.fromJWT(_jwt).obs;
    });
  }

  removeGraphqlClientJwt() {
    parkaGraphqlClient.update((val) {
      this.parkaGraphqlClient = null.obs;
      this.parkaGraphqlClient = new ParkaGraphqlClient().obs;
    });
  }
}
