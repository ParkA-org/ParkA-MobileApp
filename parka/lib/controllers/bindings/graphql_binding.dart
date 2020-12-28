import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../graphql_controller.dart';

class GraphqlClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GraphqlClientController(),
        builder: () => GraphqlClientController());
  }
}
