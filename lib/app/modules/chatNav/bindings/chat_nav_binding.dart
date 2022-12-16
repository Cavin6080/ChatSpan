import 'package:get/get.dart';

import '../controllers/chat_nav_controller.dart';

class ChatNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatNavController>(
      () => ChatNavController(),
    );
  }
}
