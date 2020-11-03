import 'package:get/state_manager.dart';

import '../graphql_controller.dart';

class GraphqlClientBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GraphqlClientController>(() => GraphqlClientController());
  }
}
