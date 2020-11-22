import 'package:ParkA/utils/graphql/parka_graphql_client.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GraphqlClientController extends GetxController {
  SharedPreferences _sharedPreferencies;
  Rx<ParkaGraphqlClient> parkaGraphqlClient;

  void _initSharedPreferencies() async {
    this._sharedPreferencies = await SharedPreferences.getInstance();
    String _jwt = this._sharedPreferencies.getString("jwt");

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
