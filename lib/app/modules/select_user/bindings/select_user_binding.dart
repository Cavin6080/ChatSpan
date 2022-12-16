import 'package:get/get.dart';

import '../controllers/select_user_controller.dart';

class SelectUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectUserController>(
      () => SelectUserController(),
    );
  }
}
