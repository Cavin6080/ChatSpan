import 'package:chat_app/widgets/form_validations.dart';
import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
      () => SignInController(
        formValidations: FormValidations(),
      ),
    );
  }
}
