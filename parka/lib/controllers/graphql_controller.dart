import 'package:ParkA/utils/graphql/parka_graphql_client.dart';
import 'package:ParkA/utils/prefs/shared_preferencies.dart';
import 'package:get/state_manager.dart';

class GraphqlClientController extends GetxController {
  Rx<ParkaGraphqlClient> parkaGraphqlClient;

  void _initSharedPreferencies() async {
    String _jwt = SharedPreferenciesUtil.storage.getString("jwt");

    this.parkaGraphqlClient = _jwt != null
        ? new ParkaGraphqlClient.fromJWT(_jwt).obs
        : new ParkaGraphqlClient().obs;
  }

  GraphqlClientController() {
    this._initSharedPreferencies();
  }

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
