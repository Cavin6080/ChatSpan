import 'package:chat_app/app/modules/chatNav/controllers/chat_nav_controller.dart';
import 'package:chat_app/app/modules/statusNav/controllers/status_nav_controller.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatNavController());
    Get.put(StatusNavController());
    Get.lazyPut<NavigationController>(
      () => NavigationController(),
    );
  }
}
