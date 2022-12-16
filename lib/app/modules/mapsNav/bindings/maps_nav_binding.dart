import 'package:get/get.dart';

import '../controllers/maps_nav_controller.dart';

class MapsNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapsNavController>(
      () => MapsNavController(),
    );
  }
}
