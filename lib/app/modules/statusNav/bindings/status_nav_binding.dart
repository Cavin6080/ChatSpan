import 'package:get/get.dart';

import '../controllers/status_nav_controller.dart';

class StatusNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusNavController>(
      () => StatusNavController(),
    );
  }
}
