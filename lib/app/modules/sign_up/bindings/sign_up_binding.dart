import 'package:chat_app/widgets/form_validations.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
      () => SignUpController(
        formValidations: FormValidations(),
      ),
    );
  }
}
