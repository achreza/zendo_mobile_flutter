import 'package:get/get.dart';

import '../controllers/change_order_controller.dart';

class ChangeOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeOrderController>(
      () => ChangeOrderController(),
    );
  }
}
