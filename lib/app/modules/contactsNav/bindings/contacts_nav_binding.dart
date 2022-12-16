import 'package:get/get.dart';

import '../controllers/contacts_nav_controller.dart';

class ContactsNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactsNavController>(
      () => ContactsNavController(),
    );
  }
}
