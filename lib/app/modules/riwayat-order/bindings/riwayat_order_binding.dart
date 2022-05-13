import 'package:get/get.dart';

import '../controllers/riwayat_order_controller.dart';

class RiwayatOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatOrderController>(
      () => RiwayatOrderController(),
    );
  }
}
