import 'package:get/get.dart';

import '../controllers/call_nav_controller.dart';

class CallNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallNavController>(
      () => CallNavController(),
    );
  }
}
